import 'package:freezed_annotation/freezed_annotation.dart';

part 'airdrop_response.freezed.dart';
part 'airdrop_response.g.dart';

@freezed
class AirdropResponse with _$AirdropResponse {
  const factory AirdropResponse({
    required String status,
    required String message,
  }) = _AirdropResponse;

  factory AirdropResponse.fromJson(Map<String, dynamic> json) =>
      _$AirdropResponseFromJson(json);
}
