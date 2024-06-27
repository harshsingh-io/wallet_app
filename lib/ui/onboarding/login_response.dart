import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required String status,
    required int balance,
    required String token,
    required String username,
    required String email,
    required String firstName,
    required String lastName,
    required bool isVerified,
    required String role,
    String? ownerId,
    String? walletAddress,
    required bool hasWallet,
    required String lastLogin,
    required String profilePictureUrl,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
