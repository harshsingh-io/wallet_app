import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Logger log = Logger(printer: PrettyPrinter());

class ApiService {
  final String baseUrl = 'https://api.socialverseapp.com';

  Future<Map<String, dynamic>> login(String mixed, String password) async {
    log.d('Attempting to login with user identifier: $mixed');
    final response = await http.post(
      Uri.parse('$baseUrl/user/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'mixed': mixed, 'password': password}),
    );
    log.d('Login response status: ${response.statusCode}');
    if (response.statusCode == 200) {
      log.d('Login successful : ${response.body}');
      return jsonDecode(response.body);
    } else {
      log.e('Failed to login: ${response.body}');
      throw Exception('Failed to login');
    }
  }

  Future<void> saveToken(String token) async {
    log.d('Saving token');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    log.d('Token saved');
  }

  Future<String?> loadToken() async {
    log.d('Loading token');
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> clearToken() async {
    log.d('Clearing token');
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    log.d('Token cleared');
  }

  Future<Map<String, dynamic>> createWallet(
      String token, String walletName, String userPin, String network) async {
    final Uri url = Uri.parse('$baseUrl/solana/wallet/create');
    final headers = {
      'Content-Type': 'application/json',
      'Flic-Token': token,
    };
    final body = jsonEncode({
      'wallet_name': walletName,
      'network': network,
      'user_pin': userPin,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        log.e(
            'Failed to create wallet: ${response.statusCode} ${response.body}');
        throw Exception(
            'Failed to create wallet: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      log.e('Exception when calling API: $e');
      throw Exception('Error connecting to API: $e');
    }
  }

  Future<Map<String, dynamic>> transferBalance(
    String token,
    String recipientAddress,
    String senderAddress,
    double amount,
    String userPin,
    String network,
  ) async {
    final Uri url = Uri.parse('$baseUrl/solana/wallet/transfer');
    final headers = {
      'Content-Type': 'application/json',
      'Flic-Token': token, // Authentication token
    };
    final body = jsonEncode({
      'recipient_address': recipientAddress,
      'network': network, // Network is always 'devnet'
      'sender_address': senderAddress,
      'amount': amount,
      'user_pin': userPin,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        log.e(
            'Failed to transfer balance: ${response.statusCode} ${response.body}');
        throw Exception(
            'Failed to transfer balance: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      log.e('Exception when calling API: $e');
      throw Exception('Error connecting to API: $e');
    }
  }

  Future<Map<String, dynamic>> retrieveBalance(
      String token, String walletAddress, String network) async {
    final Uri url = Uri.parse(
        '$baseUrl/solana/wallet/balance?wallet_address=$walletAddress&network=$network');
    final headers = {
      'Content-Type': 'application/json',
      'Flic-Token': token,
    };

    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        log.e(
            'Failed to retrieve balance: ${response.statusCode} ${response.body}');
        throw Exception(
            'Failed to retrieve balance: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      log.e('Exception when calling API: $e');
      throw Exception('Error connecting to API: $e');
    }
  }

  // Method to request an airdrop
  Future<Map<String, dynamic>> requestAirdrop(
      String token, String walletAddress, double amount, String network) async {
    final Uri url = Uri.parse('$baseUrl/solana/wallet/airdrop');
    final headers = {
      'Content-Type': 'application/json',
      'Flic-Token': token, // Use the Flic-Token for authentication
    };
    final body = jsonEncode({
      'wallet_address': walletAddress,
      'network': network, // As specified, network is always 'devnet'
      'amount': amount,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        log.e(
            'Failed to request airdrop: ${response.statusCode} ${response.body}');
        throw Exception(
            'Failed to request airdrop: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      log.e('Exception when calling API: $e');
      throw Exception('Error connecting to API: $e');
    }
  }
}
