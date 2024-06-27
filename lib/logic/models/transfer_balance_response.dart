import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer_balance_response.freezed.dart';
part 'transfer_balance_response.g.dart';

@freezed
class TransferBalanceResponse with _$TransferBalanceResponse {
  const factory TransferBalanceResponse({
    required String status,
    required String message,
    required String transactionId,
  }) = _TransferBalanceResponse;

  factory TransferBalanceResponse.fromJson(Map<String, dynamic> json) =>
      _$TransferBalanceResponseFromJson(json);
}
