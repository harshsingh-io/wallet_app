// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'airdrop_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AirdropRequestImpl _$$AirdropRequestImplFromJson(Map<String, dynamic> json) =>
    _$AirdropRequestImpl(
      walletAddress: json['walletAddress'] as String,
      network: json['network'] as String,
      amount: (json['amount'] as num).toInt(),
    );

Map<String, dynamic> _$$AirdropRequestImplToJson(
        _$AirdropRequestImpl instance) =>
    <String, dynamic>{
      'walletAddress': instance.walletAddress,
      'network': instance.network,
      'amount': instance.amount,
    };
