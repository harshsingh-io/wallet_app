import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:wallet_app/logic/models/airdrop_request.dart';
import 'package:wallet_app/logic/models/airdrop_response.dart';
import 'package:wallet_app/logic/models/balance_response.dart';
import 'package:wallet_app/logic/models/balance_transfer_request.dart';
import 'package:wallet_app/logic/models/login_response.dart';
import 'package:wallet_app/logic/models/transfer_balance_response.dart';
import 'package:wallet_app/logic/models/wallet_response.dart';
import 'package:wallet_app/logic/services/api_service_manager.dart';


Logger log = Logger(
  printer: PrettyPrinter(),
);

class WalletProvider with ChangeNotifier {
  final ApiServiceManager _apiServiceManager;

  WalletProvider(this._apiServiceManager) {
    _loadData();
  }

  String? _token;
  double _balance = 0.0;
  bool _isLoading = false;
  bool _hasWallet = false;
  String? _walletAddress;
  String? _username;
  String? _email;
  String? _firstName;
  String? _lastName;
  String? _lastLogin;
  String? _profilePictureUrl;

  double get balance => _balance;
  bool get isLoading => _isLoading;
  bool get hasWallet => _hasWallet;
  String? get walletAddress => _walletAddress;
  String? get username => _username;
  String? get email => _email;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get lastLogin => _lastLogin;
  String? get profilePictureUrl => _profilePictureUrl;

  Future<void> _loadData() async {
    _isLoading = true;
    notifyListeners();
    _token = await _apiServiceManager.loadToken();
    if (_token != null) {
      log.i("Token loaded: $_token");
      _walletAddress = await _apiServiceManager.loadWalletAddress();
      log.i("Wallet Address loaded: $_walletAddress");
      final loginResponse = await _apiServiceManager.loadLoginResponse();
      if (loginResponse != null) {
        _balance = loginResponse.balance.toDouble();
        _hasWallet = loginResponse.hasWallet;
        _walletAddress = loginResponse.walletAddress;
        _username = loginResponse.username;
        _email = loginResponse.email;
        _firstName = loginResponse.firstName;
        _lastName = loginResponse.lastName;
        _lastLogin = loginResponse.lastLogin;
        _profilePictureUrl = loginResponse.profilePictureUrl;
      }
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> login(String mixed, String password) async {
    try {
      _isLoading = true;
      notifyListeners();
      final LoginResponse response =
          await _apiServiceManager.login(mixed, password);
      _token = response.token;
      await _apiServiceManager.saveToken(_token!);
      await _apiServiceManager.saveLoginResponse(response);
      _balance = response.balance.toDouble();
      _hasWallet = response.hasWallet;
      _walletAddress = response.walletAddress;
      _username = response.username;
      _email = response.email;
      _firstName = response.firstName;
      _lastName = response.lastName;
      _lastLogin = response.lastLogin;
      _profilePictureUrl = response.profilePictureUrl;

      log.i("Logged in and token saved: $_token");
      log.i("Username: $_username");
      log.i("Email: $_email");
      log.i("First Name: $_firstName");
      log.i("Last Name: $_lastName");
      log.i("Last Login: $_lastLogin");
      log.i("Profile Picture URL: $_profilePictureUrl");

      await _apiServiceManager.saveWalletAddress(_walletAddress!);
      log.i("Wallet address saved: $_walletAddress");
    } catch (error) {
      throw error;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await _apiServiceManager.clearToken();
    await _apiServiceManager.clearWalletAddress();
    await _apiServiceManager.clearLoginResponse();
    _token = null;
    _balance = 0.0;
    _hasWallet = false;
    _walletAddress = null;
    _username = null;
    _email = null;
    _firstName = null;
    _lastName = null;
    _lastLogin = null;
    _profilePictureUrl = null;
    log.i("Logged out and cleared token and wallet address");
    notifyListeners();
  }

  Future<void> createWallet(
      String walletName, String userPin, String network) async {
    if (_token == null) {
      throw Exception('Token is null');
    }
    try {
      _isLoading = true;
      notifyListeners();
      final WalletResponse response = await _apiServiceManager.createWallet(
          _token!, walletName, userPin, network);
      _walletAddress = response.publicKey;
      _hasWallet = true;
      await _apiServiceManager.saveWalletAddress(_walletAddress!);
      log.i("Wallet created and address saved: $_walletAddress");
    } catch (error) {
      throw error;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> transferBalance(String recipientAddress, String senderAddress,
      double amount, String userPin, String network) async {
    if (_token == null) {
      throw Exception('Token is null');
    }
    try {
      _isLoading = true;
      notifyListeners();
      final BalanceTransferRequest request = BalanceTransferRequest(
        recipientAddress: recipientAddress,
        network: network,
        senderAddress: senderAddress,
        amount: amount,
        userPin: userPin,
      );
      final TransferBalanceResponse response =
          await _apiServiceManager.transferBalance(_token!, request);
      log.i("Transfer Balance API response: ${response.toString()}");
    } catch (error) {
      throw error;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> retrieveBalance(String network, String walletAddress) async {
    if (_token == null) {
      throw Exception('Token is null');
    }
    try {
      _isLoading = true;
      notifyListeners();
      final BalanceResponse response = await _apiServiceManager.retrieveBalance(
          _token!, network, walletAddress);
      if (response.status == 'error' && response.message.contains('401')) {
        await logout();
        throw Exception('Session expired. Please log in again.');
      } else {
        _balance = response.balance.toDouble();
      }
    } catch (error) {
      throw error;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> requestAirdrop(
      String walletAddress, String network, int amount) async {
    if (_token == null) {
      throw Exception('Token is null');
    }
    try {
      _isLoading = true;
      notifyListeners();
      final AirdropRequest request = AirdropRequest(
        walletAddress: walletAddress,
        network: network,
        amount: amount,
      );
      final AirdropResponse response =
          await _apiServiceManager.requestAirdrop(_token!, request);
      log.i("Request Airdrop API response: ${response.toString()}");
    } catch (error) {
      throw error;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  bool get isLoggedIn => _token != null;
}
