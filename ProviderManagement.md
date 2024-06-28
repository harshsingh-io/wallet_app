# WalletProvider for Flutter Wallet Application

## Overview

The `WalletProvider` class is a ChangeNotifier that manages the state and interactions of the wallet-related operations in the Flutter Wallet Application. It uses the `ApiService` class to communicate with the backend API and `shared_preferences` for storing and retrieving authentication tokens and user details.

## Features

- **User Authentication**
- **Token Management**
- **Wallet Creation**
- **Balance Transfer**
- **Balance Retrieval**
- **Airdrop Requests**
- **State Management**

## WalletProvider Class

### Dependencies

- `logger`: Used for logging.
- `shared_preferences`: Used for storing the authentication token and user details.
- `api_service`: Custom service for API interactions.

### Implementation

#### User Authentication

Logs in the user using their credentials and stores the retrieved token and user details in shared preferences.

```dart
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
```
#### Token Management

Loads the authentication token and user details from shared preferences.

```dart
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
    _profilePictureUrl = prefs.getString('profile_picture_url');
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
```

#### Wallet Creation

Creates a new wallet for the user and stores the wallet details in shared preferences.

```dart
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
```

#### Balance Transfer

Transfers balance from one wallet to another.

```dart
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
```

#### Balance Retrieval

Retrieves the balance of a specific wallet.

```dart
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
```

#### Airdrop Requests

Requests an airdrop to a specific wallet.

```dart
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
```

## State Management

The `WalletProvider` class uses `ChangeNotifier` to manage and notify listeners about changes in the application state, such as loading status, user details, and wallet information.


## Conclusion

The `WalletProvider` class provides a comprehensive and structured way to manage the state and interactions of the wallet-related operations in the Flutter Wallet Application. It ensures secure and efficient communication with the backend, manages authentication tokens and user details, and handles errors appropriately.