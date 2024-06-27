// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WalletResponse _$WalletResponseFromJson(Map<String, dynamic> json) {
  return _WalletResponse.fromJson(json);
}

/// @nodoc
mixin _$WalletResponse {
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get walletName => throw _privateConstructorUsedError;
  String get userPin => throw _privateConstructorUsedError;
  String get network => throw _privateConstructorUsedError;
  String get publicKey => throw _privateConstructorUsedError;
  List<int> get secretKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletResponseCopyWith<WalletResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletResponseCopyWith<$Res> {
  factory $WalletResponseCopyWith(
          WalletResponse value, $Res Function(WalletResponse) then) =
      _$WalletResponseCopyWithImpl<$Res, WalletResponse>;
  @useResult
  $Res call(
      {String status,
      String message,
      String walletName,
      String userPin,
      String network,
      String publicKey,
      List<int> secretKey});
}

/// @nodoc
class _$WalletResponseCopyWithImpl<$Res, $Val extends WalletResponse>
    implements $WalletResponseCopyWith<$Res> {
  _$WalletResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? walletName = null,
    Object? userPin = null,
    Object? network = null,
    Object? publicKey = null,
    Object? secretKey = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      walletName: null == walletName
          ? _value.walletName
          : walletName // ignore: cast_nullable_to_non_nullable
              as String,
      userPin: null == userPin
          ? _value.userPin
          : userPin // ignore: cast_nullable_to_non_nullable
              as String,
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      publicKey: null == publicKey
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as String,
      secretKey: null == secretKey
          ? _value.secretKey
          : secretKey // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletResponseImplCopyWith<$Res>
    implements $WalletResponseCopyWith<$Res> {
  factory _$$WalletResponseImplCopyWith(_$WalletResponseImpl value,
          $Res Function(_$WalletResponseImpl) then) =
      __$$WalletResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      String message,
      String walletName,
      String userPin,
      String network,
      String publicKey,
      List<int> secretKey});
}

/// @nodoc
class __$$WalletResponseImplCopyWithImpl<$Res>
    extends _$WalletResponseCopyWithImpl<$Res, _$WalletResponseImpl>
    implements _$$WalletResponseImplCopyWith<$Res> {
  __$$WalletResponseImplCopyWithImpl(
      _$WalletResponseImpl _value, $Res Function(_$WalletResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? walletName = null,
    Object? userPin = null,
    Object? network = null,
    Object? publicKey = null,
    Object? secretKey = null,
  }) {
    return _then(_$WalletResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      walletName: null == walletName
          ? _value.walletName
          : walletName // ignore: cast_nullable_to_non_nullable
              as String,
      userPin: null == userPin
          ? _value.userPin
          : userPin // ignore: cast_nullable_to_non_nullable
              as String,
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      publicKey: null == publicKey
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as String,
      secretKey: null == secretKey
          ? _value._secretKey
          : secretKey // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletResponseImpl implements _WalletResponse {
  const _$WalletResponseImpl(
      {required this.status,
      required this.message,
      required this.walletName,
      required this.userPin,
      required this.network,
      required this.publicKey,
      required final List<int> secretKey})
      : _secretKey = secretKey;

  factory _$WalletResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletResponseImplFromJson(json);

  @override
  final String status;
  @override
  final String message;
  @override
  final String walletName;
  @override
  final String userPin;
  @override
  final String network;
  @override
  final String publicKey;
  final List<int> _secretKey;
  @override
  List<int> get secretKey {
    if (_secretKey is EqualUnmodifiableListView) return _secretKey;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_secretKey);
  }

  @override
  String toString() {
    return 'WalletResponse(status: $status, message: $message, walletName: $walletName, userPin: $userPin, network: $network, publicKey: $publicKey, secretKey: $secretKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.walletName, walletName) ||
                other.walletName == walletName) &&
            (identical(other.userPin, userPin) || other.userPin == userPin) &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.publicKey, publicKey) ||
                other.publicKey == publicKey) &&
            const DeepCollectionEquality()
                .equals(other._secretKey, _secretKey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      message,
      walletName,
      userPin,
      network,
      publicKey,
      const DeepCollectionEquality().hash(_secretKey));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletResponseImplCopyWith<_$WalletResponseImpl> get copyWith =>
      __$$WalletResponseImplCopyWithImpl<_$WalletResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletResponseImplToJson(
      this,
    );
  }
}

abstract class _WalletResponse implements WalletResponse {
  const factory _WalletResponse(
      {required final String status,
      required final String message,
      required final String walletName,
      required final String userPin,
      required final String network,
      required final String publicKey,
      required final List<int> secretKey}) = _$WalletResponseImpl;

  factory _WalletResponse.fromJson(Map<String, dynamic> json) =
      _$WalletResponseImpl.fromJson;

  @override
  String get status;
  @override
  String get message;
  @override
  String get walletName;
  @override
  String get userPin;
  @override
  String get network;
  @override
  String get publicKey;
  @override
  List<int> get secretKey;
  @override
  @JsonKey(ignore: true)
  _$$WalletResponseImplCopyWith<_$WalletResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
