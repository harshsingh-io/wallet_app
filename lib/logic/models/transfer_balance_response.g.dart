// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_balance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransferBalanceResponseImpl _$$TransferBalanceResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TransferBalanceResponseImpl(
      status: json['status'] as String,
      message: json['message'] as String,
      transactionId: json['transactionId'] as String,
    );

Map<String, dynamic> _$$TransferBalanceResponseImplToJson(
        _$TransferBalanceResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'transactionId': instance.transactionId,
    };
