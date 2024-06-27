// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'airdrop_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AirdropRequest _$AirdropRequestFromJson(Map<String, dynamic> json) {
  return _AirdropRequest.fromJson(json);
}

/// @nodoc
mixin _$AirdropRequest {
  String get walletAddress => throw _privateConstructorUsedError;
  String get network => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AirdropRequestCopyWith<AirdropRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AirdropRequestCopyWith<$Res> {
  factory $AirdropRequestCopyWith(
          AirdropRequest value, $Res Function(AirdropRequest) then) =
      _$AirdropRequestCopyWithImpl<$Res, AirdropRequest>;
  @useResult
  $Res call({String walletAddress, String network, int amount});
}

/// @nodoc
class _$AirdropRequestCopyWithImpl<$Res, $Val extends AirdropRequest>
    implements $AirdropRequestCopyWith<$Res> {
  _$AirdropRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletAddress = null,
    Object? network = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AirdropRequestImplCopyWith<$Res>
    implements $AirdropRequestCopyWith<$Res> {
  factory _$$AirdropRequestImplCopyWith(_$AirdropRequestImpl value,
          $Res Function(_$AirdropRequestImpl) then) =
      __$$AirdropRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String walletAddress, String network, int amount});
}

/// @nodoc
class __$$AirdropRequestImplCopyWithImpl<$Res>
    extends _$AirdropRequestCopyWithImpl<$Res, _$AirdropRequestImpl>
    implements _$$AirdropRequestImplCopyWith<$Res> {
  __$$AirdropRequestImplCopyWithImpl(
      _$AirdropRequestImpl _value, $Res Function(_$AirdropRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletAddress = null,
    Object? network = null,
    Object? amount = null,
  }) {
    return _then(_$AirdropRequestImpl(
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AirdropRequestImpl implements _AirdropRequest {
  const _$AirdropRequestImpl(
      {required this.walletAddress,
      required this.network,
      required this.amount});

  factory _$AirdropRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AirdropRequestImplFromJson(json);

  @override
  final String walletAddress;
  @override
  final String network;
  @override
  final int amount;

  @override
  String toString() {
    return 'AirdropRequest(walletAddress: $walletAddress, network: $network, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AirdropRequestImpl &&
            (identical(other.walletAddress, walletAddress) ||
                other.walletAddress == walletAddress) &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, walletAddress, network, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AirdropRequestImplCopyWith<_$AirdropRequestImpl> get copyWith =>
      __$$AirdropRequestImplCopyWithImpl<_$AirdropRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AirdropRequestImplToJson(
      this,
    );
  }
}

abstract class _AirdropRequest implements AirdropRequest {
  const factory _AirdropRequest(
      {required final String walletAddress,
      required final String network,
      required final int amount}) = _$AirdropRequestImpl;

  factory _AirdropRequest.fromJson(Map<String, dynamic> json) =
      _$AirdropRequestImpl.fromJson;

  @override
  String get walletAddress;
  @override
  String get network;
  @override
  int get amount;
  @override
  @JsonKey(ignore: true)
  _$$AirdropRequestImplCopyWith<_$AirdropRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
