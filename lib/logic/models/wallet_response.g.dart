// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletResponseImpl _$$WalletResponseImplFromJson(Map<String, dynamic> json) =>
    _$WalletResponseImpl(
      status: json['status'] as String,
      message: json['message'] as String,
      walletName: json['walletName'] as String,
      userPin: json['userPin'] as String,
      network: json['network'] as String,
      publicKey: json['publicKey'] as String,
      secretKey: (json['secretKey'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$WalletResponseImplToJson(
        _$WalletResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'walletName': instance.walletName,
      'userPin': instance.userPin,
      'network': instance.network,
      'publicKey': instance.publicKey,
      'secretKey': instance.secretKey,
    };
