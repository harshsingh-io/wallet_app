import 'package:freezed_annotation/freezed_annotation.dart';

part 'balance_transfer_request.freezed.dart';
part 'balance_transfer_request.g.dart';

@freezed
class BalanceTransferRequest with _$BalanceTransferRequest {
  const factory BalanceTransferRequest({
    required String recipientAddress,
    required String network,
    required String senderAddress,
    required double amount,
    required String userPin,
  }) = _BalanceTransferRequest;

  factory BalanceTransferRequest.fromJson(Map<String, dynamic> json) =>
      _$BalanceTransferRequestFromJson(json);
}
