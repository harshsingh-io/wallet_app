// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'balance_transfer_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BalanceTransferRequest _$BalanceTransferRequestFromJson(
    Map<String, dynamic> json) {
  return _BalanceTransferRequest.fromJson(json);
}

/// @nodoc
mixin _$BalanceTransferRequest {
  String get recipientAddress => throw _privateConstructorUsedError;
  String get network => throw _privateConstructorUsedError;
  String get senderAddress => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get userPin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BalanceTransferRequestCopyWith<BalanceTransferRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BalanceTransferRequestCopyWith<$Res> {
  factory $BalanceTransferRequestCopyWith(BalanceTransferRequest value,
          $Res Function(BalanceTransferRequest) then) =
      _$BalanceTransferRequestCopyWithImpl<$Res, BalanceTransferRequest>;
  @useResult
  $Res call(
      {String recipientAddress,
      String network,
      String senderAddress,
      double amount,
      String userPin});
}

/// @nodoc
class _$BalanceTransferRequestCopyWithImpl<$Res,
        $Val extends BalanceTransferRequest>
    implements $BalanceTransferRequestCopyWith<$Res> {
  _$BalanceTransferRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipientAddress = null,
    Object? network = null,
    Object? senderAddress = null,
    Object? amount = null,
    Object? userPin = null,
  }) {
    return _then(_value.copyWith(
      recipientAddress: null == recipientAddress
          ? _value.recipientAddress
          : recipientAddress // ignore: cast_nullable_to_non_nullable
              as String,
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      senderAddress: null == senderAddress
          ? _value.senderAddress
          : senderAddress // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      userPin: null == userPin
          ? _value.userPin
          : userPin // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BalanceTransferRequestImplCopyWith<$Res>
    implements $BalanceTransferRequestCopyWith<$Res> {
  factory _$$BalanceTransferRequestImplCopyWith(
          _$BalanceTransferRequestImpl value,
          $Res Function(_$BalanceTransferRequestImpl) then) =
      __$$BalanceTransferRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String recipientAddress,
      String network,
      String senderAddress,
      double amount,
      String userPin});
}

/// @nodoc
class __$$BalanceTransferRequestImplCopyWithImpl<$Res>
    extends _$BalanceTransferRequestCopyWithImpl<$Res,
        _$BalanceTransferRequestImpl>
    implements _$$BalanceTransferRequestImplCopyWith<$Res> {
  __$$BalanceTransferRequestImplCopyWithImpl(
      _$BalanceTransferRequestImpl _value,
      $Res Function(_$BalanceTransferRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipientAddress = null,
    Object? network = null,
    Object? senderAddress = null,
    Object? amount = null,
    Object? userPin = null,
  }) {
    return _then(_$BalanceTransferRequestImpl(
      recipientAddress: null == recipientAddress
          ? _value.recipientAddress
          : recipientAddress // ignore: cast_nullable_to_non_nullable
              as String,
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      senderAddress: null == senderAddress
          ? _value.senderAddress
          : senderAddress // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      userPin: null == userPin
          ? _value.userPin
          : userPin // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BalanceTransferRequestImpl implements _BalanceTransferRequest {
  const _$BalanceTransferRequestImpl(
      {required this.recipientAddress,
      required this.network,
      required this.senderAddress,
      required this.amount,
      required this.userPin});

  factory _$BalanceTransferRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$BalanceTransferRequestImplFromJson(json);

  @override
  final String recipientAddress;
  @override
  final String network;
  @override
  final String senderAddress;
  @override
  final double amount;
  @override
  final String userPin;

  @override
  String toString() {
    return 'BalanceTransferRequest(recipientAddress: $recipientAddress, network: $network, senderAddress: $senderAddress, amount: $amount, userPin: $userPin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BalanceTransferRequestImpl &&
            (identical(other.recipientAddress, recipientAddress) ||
                other.recipientAddress == recipientAddress) &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.senderAddress, senderAddress) ||
                other.senderAddress == senderAddress) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.userPin, userPin) || other.userPin == userPin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, recipientAddress, network, senderAddress, amount, userPin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BalanceTransferRequestImplCopyWith<_$BalanceTransferRequestImpl>
      get copyWith => __$$BalanceTransferRequestImplCopyWithImpl<
          _$BalanceTransferRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BalanceTransferRequestImplToJson(
      this,
    );
  }
}

abstract class _BalanceTransferRequest implements BalanceTransferRequest {
  const factory _BalanceTransferRequest(
      {required final String recipientAddress,
      required final String network,
      required final String senderAddress,
      required final double amount,
      required final String userPin}) = _$BalanceTransferRequestImpl;

  factory _BalanceTransferRequest.fromJson(Map<String, dynamic> json) =
      _$BalanceTransferRequestImpl.fromJson;

  @override
  String get recipientAddress;
  @override
  String get network;
  @override
  String get senderAddress;
  @override
  double get amount;
  @override
  String get userPin;
  @override
  @JsonKey(ignore: true)
  _$$BalanceTransferRequestImplCopyWith<_$BalanceTransferRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
