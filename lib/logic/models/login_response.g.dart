// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      status: json['status'] as String,
      balance: (json['balance'] as num).toInt(),
      token: json['token'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      isVerified: json['isVerified'] as bool,
      role: json['role'] as String,
      ownerId: json['ownerId'] as String?,
      walletAddress: json['walletAddress'] as String?,
      hasWallet: json['hasWallet'] as bool,
      lastLogin: json['lastLogin'] as String,
      profilePictureUrl: json['profilePictureUrl'] as String,
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'balance': instance.balance,
      'token': instance.token,
      'username': instance.username,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'isVerified': instance.isVerified,
      'role': instance.role,
      'ownerId': instance.ownerId,
      'walletAddress': instance.walletAddress,
      'hasWallet': instance.hasWallet,
      'lastLogin': instance.lastLogin,
      'profilePictureUrl': instance.profilePictureUrl,
    };
