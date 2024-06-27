// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BalanceResponseImpl _$$BalanceResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$BalanceResponseImpl(
      status: json['status'] as String,
      message: json['message'] as String,
      balance: (json['balance'] as num).toInt(),
    );

Map<String, dynamic> _$$BalanceResponseImplToJson(
        _$BalanceResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'balance': instance.balance,
    };
