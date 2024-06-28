import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_app/logic/services/api_service.dart';

Logger log = Logger(printer: PrettyPrinter());

class WalletProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();

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

  double get balance => _balance;
  bool get isLoading => _isLoading;
  bool get hasWallet => _hasWallet;
  String? get walletAddress => _walletAddress;
  String? get username => _username;
  String? get email => _email;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get lastLogin => _lastLogin;

  WalletProvider() {
    _loadToken();
  }

  Future<void> _loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
    if (_token != null) {
      // Load profile details if token exists
      _username = prefs.getString('username');
      _email = prefs.getString('email');
      _firstName = prefs.getString('first_name');
      _lastName = prefs.getString('last_name');
      _lastLogin = prefs.getString('last_login');
      _walletAddress = prefs.getString('wallet_address');
      notifyListeners();
    }
  }

  Future<void> login(String mixed, String password) async {
    try {
      _isLoading = true;
      notifyListeners();
      final response = await _apiService.login(mixed, password);
      _token = response['token'];
      _username = response['username'];
      _email = response['email'];
      _firstName = response['first_name'];
      _lastName = response['last_name'];
      _lastLogin = response['last_login'];
      _walletAddress = response['wallet_address'];

      // Save details to SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', _token!);
      await prefs.setString('username', _username!);
      await prefs.setString('email', _email!);
      await prefs.setString('first_name', _firstName!);
      await prefs.setString('last_name', _lastName!);
      await prefs.setString('last_login', _lastLogin!);
      await prefs.setString('wallet_address', _walletAddress!);
    } catch (error) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('username');
    await prefs.remove('email');
    await prefs.remove('first_name');
    await prefs.remove('last_name');
    await prefs.remove('last_login');
    await prefs.remove('wallet_address');
    _token = null;
    _username = null;
    _email = null;
    _firstName = null;
    _lastName = null;
    _lastLogin = null;
    _walletAddress = null;
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
      final response =
          await _apiService.createWallet(_token!, walletName, userPin, network);

      _walletAddress = response['publicKey'];
      _hasWallet = true;

      // Storing the wallet information locally
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('walletAddress', _walletAddress!);
      await prefs.setString('walletName', response['walletName']);
      await prefs.setString('userPin', response['userPin']);
      await prefs.setString('network', response['network']);
      await prefs.setString('secretKey', response['secretKey']);

      // Optionally, store the entire wallet response if needed elsewhere in your app
      await prefs.setString('walletResponse', jsonEncode(response));
    } catch (error) {
      rethrow;
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
      await _apiService.transferBalance(
          _token!, recipientAddress, senderAddress, amount, userPin, network);
    } catch (error) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> retrieveBalance(String walletAddress, String network) async {
    if (_token == null) {
      throw Exception('Token is null');
    }
    try {
      _isLoading = true;
      notifyListeners();
      final response =
          await _apiService.retrieveBalance(_token!, walletAddress, network);
      _balance = (response['balance'] as num).toDouble();
    } catch (error) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> requestAirdrop(String walletAdress, double amount, String network) async {
    if (_token == null) {
      throw Exception('Token is null');
    }
    try {
      _isLoading = true;
      notifyListeners();
      await _apiService.requestAirdrop(_token!, walletAdress, amount, network);
    } catch (error) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  bool get isLoggedIn => _token != null;
}
