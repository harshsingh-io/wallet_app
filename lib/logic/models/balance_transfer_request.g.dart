// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_transfer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BalanceTransferRequestImpl _$$BalanceTransferRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$BalanceTransferRequestImpl(
      recipientAddress: json['recipientAddress'] as String,
      network: json['network'] as String,
      senderAddress: json['senderAddress'] as String,
      amount: (json['amount'] as num).toDouble(),
      userPin: json['userPin'] as String,
    );

Map<String, dynamic> _$$BalanceTransferRequestImplToJson(
        _$BalanceTransferRequestImpl instance) =>
    <String, dynamic>{
      'recipientAddress': instance.recipientAddress,
      'network': instance.network,
      'senderAddress': instance.senderAddress,
      'amount': instance.amount,
      'userPin': instance.userPin,
    };
