// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:logger/logger.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:wallet_app/apiBase.dart';
// import 'package:wallet_app/logic/models/airdrop_request.dart';
// import 'package:wallet_app/logic/models/airdrop_response.dart';
// import 'package:wallet_app/logic/models/balance_response.dart';
// import 'package:wallet_app/logic/models/balance_transfer_request.dart';
// import 'package:wallet_app/logic/models/login_response.dart';
// import 'package:wallet_app/logic/models/transfer_balance_response.dart';
// import 'package:wallet_app/logic/models/wallet_response.dart';
// import 'package:wallet_app/logic/services/api_service.dart';

// Logger log = Logger(
//   printer: PrettyPrinter(),
// );

// class ApiServiceManager {
//   late final Dio _dio;
//   late final ApiService _apiService;

//   ApiServiceManager() {
//     _dio = Dio(BaseOptions(baseUrl: apiBase));
//     _apiService = ApiService(_dio);
//   }

//   Future<LoginResponse> login(String mixed, String password) async {
//     log.i("Login API called with username: $mixed");
//     try {
//       final response = await _apiService.login(mixed, password);
//       log.t('Login Response : $response');
//       // log.i("Login API response: ${response.toString()}");
//       return response;
//     } on DioError catch (e) {
//       log.e("Login API failed with error: ${e.message}");
//       throw Exception('Failed to login');
//     }
//   }

//   Future<void> saveToken(String token) async {
//     log.i("Saving token: $token");
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('token', token);
//   }

//   Future<String?> loadToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString('token');
//     log.i("Loaded token: $token");
//     return token;
//   }

//   Future<void> clearToken() async {
//     log.i("Clearing token");
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove('token');
//   }

//   Future<void> saveWalletAddress(String walletAddress) async {
//     log.i("Saving wallet address: $walletAddress");
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('walletAddress', walletAddress);
//   }

//   Future<String?> loadWalletAddress() async {
//     final prefs = await SharedPreferences.getInstance();
//     String? walletAddress = prefs.getString('walletAddress');
//     log.i("Loaded wallet address: $walletAddress");
//     return walletAddress;
//   }

//   Future<void> clearWalletAddress() async {
//     log.i("Clearing wallet address");
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove('walletAddress');
//   }

//   Future<WalletResponse> createWallet(
//       String token, String walletName, String userPin, String network) async {
//     log.i(
//         "Create Wallet API called with walletName: $walletName, network: $network");
//     try {
//       final response =
//           await _apiService.createWallet(token, walletName, network, userPin);
//       log.i("Create Wallet API response: ${response.toString()}");
//       return response;
//     } on DioError catch (e) {
//       log.e("Create Wallet API failed with error: ${e.message}");
//       throw Exception('Failed to create wallet');
//     }
//   }

//   Future<TransferBalanceResponse> transferBalance(
//       String token, BalanceTransferRequest request) async {
//     log.i("Transfer Balance API called with request: ${request.toString()}");
//     try {
//       final response = await _apiService.transferBalance(token, request);
//       log.i("Transfer Balance API response: ${response.toString()}");
//       return response;
//     } on DioError catch (e) {
//       log.e("Transfer Balance API failed with error: ${e.message}");
//       throw Exception('Failed to transfer balance');
//     }
//   }

//   Future<BalanceResponse> retrieveBalance(
//       String token, String network, String walletAddress) async {
//     log.i(
//         "Retrieve Balance API called with token, network: $network and walletAddress: $walletAddress");
//     try {
//       final response =
//           await _apiService.retrieveBalance(token, network, walletAddress);
//       log.i("Retrieve Balance API response: ${response.toString()}");
//       return response;
//     } on DioError catch (e) {
//       log.e("Retrieve Balance API failed with error: ${e.message}");
//       throw Exception('Failed to retrieve balance');
//     }
//   }

//   Future<AirdropResponse> requestAirdrop(
//       String token, AirdropRequest request, ) async {
//     log.i("Request Airdrop API called with request: ${request.toString()}");
//     try {
//       final response = await _apiService.requestAirdrop(token, request,);
//       log.i("Request Airdrop API response: ${response.toString()}");
//       return response;
//     } on DioError catch (e) {
//       log.e("Request Airdrop API failed with error: ${e.message}");
//       throw Exception('Failed to request airdrop');
//     }
//   }

//   Future<void> saveLoginResponse(LoginResponse response) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('loginResponse', jsonEncode(response));
//   }

//   Future<LoginResponse?> loadLoginResponse() async {
//     final prefs = await SharedPreferences.getInstance();
//     String? jsonString = prefs.getString('loginResponse');
//     if (jsonString != null) {
//       return LoginResponse.fromJson(jsonDecode(jsonString));
//     }
//     return null;
//   }

//   Future<void> clearLoginResponse() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove('loginResponse');
//   }
// }
