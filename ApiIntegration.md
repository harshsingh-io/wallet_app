# API Service for Flutter Wallet Application

## Overview

This API service class is used in the Flutter Wallet Application to handle all the backend interactions, including user authentication, wallet creation, balance transfer, balance retrieval, and airdrop requests. The service leverages the HTTP protocol and uses shared preferences to manage the authentication token.

## Features

- **User Login**
- **Token Management**
- **Wallet Creation**
- **Balance Transfer**
- **Balance Retrieval**
- **Airdrop Request**

## API Service Class

### Dependencies

- `logger`: Used for logging.
- `shared_preferences`: Used for storing the authentication token.
- `http`: Used for making HTTP requests.

### Implementation

#### User Login

Logs in the user using their credentials and retrieves the authentication token.

```dart
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
```


#### Token Management

Saves, loads, and clears the authentication token using shared preferences.

```dart
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
```

#### Wallet Creation

Creates a new wallet for the user.

```dart
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
```

#### Balance Transfer

Transfers balance from one wallet to another.

```dart
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
    'Flic-Token': token,
  };
  final body = jsonEncode({
    'recipient_address': recipientAddress,
    'network': network,
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
```

#### Balance Retrieval

Retrieves the balance of a specific wallet.

```dart
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
```

#### Airdrop Request

Requests an airdrop to a specific wallet.

```dart
Future<Map<String, dynamic>> requestAirdrop(
    String token, String walletAddress, double amount, String network) async {
  final Uri url = Uri.parse('$baseUrl/solana/wallet/airdrop');
  final headers = {
    'Content-Type': 'application/json',
    'Flic-Token': token,
  };
  final body = jsonEncode({
    'wallet_address': walletAddress,
    'network': network,
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
```

## Error Handling

Each method in the `ApiService` class includes error handling to manage API call failures and unexpected errors. Errors are logged using the `Logger` package and exceptions are thrown to indicate failures.

## Conclusion

This `ApiService` class provides a comprehensive and structured way to interact with the backend APIs required for the Flutter Wallet Application. It ensures secure and efficient communication with the backend, manages authentication tokens, and handles errors appropriately.
