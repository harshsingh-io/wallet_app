class LoginResponse {
  final String status;
  final int balance;
  final String token;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final bool isVerified;
  final String role;
  final String ownerId;
  final String walletAddress;
  final bool hasWallet;
  final String lastLogin;
  final String profilePictureUrl;

  LoginResponse({
    required this.status,
    required this.balance,
    required this.token,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.isVerified,
    required this.role,
    required this.ownerId,
    required this.walletAddress,
    required this.hasWallet,
    required this.lastLogin,
    required this.profilePictureUrl,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'],
      balance: json['balance'],
      token: json['token'],
      username: json['username'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      isVerified: json['isVerified'],
      role: json['role'],
      ownerId: json['ownerId'],
      walletAddress: json['walletAddress'],
      hasWallet: json['hasWallet'],
      lastLogin: json['lastLogin'],
      profilePictureUrl: json['profilePictureUrl'],
    );
  }
}
