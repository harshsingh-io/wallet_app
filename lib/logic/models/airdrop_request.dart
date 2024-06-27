import 'package:freezed_annotation/freezed_annotation.dart';

part 'airdrop_request.freezed.dart';
part 'airdrop_request.g.dart';

@freezed
class AirdropRequest with _$AirdropRequest {
  const factory AirdropRequest({
    required String walletAddress,
    required String network,
    required int amount,
  }) = _AirdropRequest;

  factory AirdropRequest.fromJson(Map<String, dynamic> json) =>
      _$AirdropRequestFromJson(json);
}
