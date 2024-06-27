// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'balance_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BalanceResponse _$BalanceResponseFromJson(Map<String, dynamic> json) {
  return _BalanceResponse.fromJson(json);
}

/// @nodoc
mixin _$BalanceResponse {
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get balance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BalanceResponseCopyWith<BalanceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BalanceResponseCopyWith<$Res> {
  factory $BalanceResponseCopyWith(
          BalanceResponse value, $Res Function(BalanceResponse) then) =
      _$BalanceResponseCopyWithImpl<$Res, BalanceResponse>;
  @useResult
  $Res call({String status, String message, int balance});
}

/// @nodoc
class _$BalanceResponseCopyWithImpl<$Res, $Val extends BalanceResponse>
    implements $BalanceResponseCopyWith<$Res> {
  _$BalanceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? balance = null,
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
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BalanceResponseImplCopyWith<$Res>
    implements $BalanceResponseCopyWith<$Res> {
  factory _$$BalanceResponseImplCopyWith(_$BalanceResponseImpl value,
          $Res Function(_$BalanceResponseImpl) then) =
      __$$BalanceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String message, int balance});
}

/// @nodoc
class __$$BalanceResponseImplCopyWithImpl<$Res>
    extends _$BalanceResponseCopyWithImpl<$Res, _$BalanceResponseImpl>
    implements _$$BalanceResponseImplCopyWith<$Res> {
  __$$BalanceResponseImplCopyWithImpl(
      _$BalanceResponseImpl _value, $Res Function(_$BalanceResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? balance = null,
  }) {
    return _then(_$BalanceResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BalanceResponseImpl implements _BalanceResponse {
  const _$BalanceResponseImpl(
      {required this.status, required this.message, required this.balance});

  factory _$BalanceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BalanceResponseImplFromJson(json);

  @override
  final String status;
  @override
  final String message;
  @override
  final int balance;

  @override
  String toString() {
    return 'BalanceResponse(status: $status, message: $message, balance: $balance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BalanceResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, balance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BalanceResponseImplCopyWith<_$BalanceResponseImpl> get copyWith =>
      __$$BalanceResponseImplCopyWithImpl<_$BalanceResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BalanceResponseImplToJson(
      this,
    );
  }
}

abstract class _BalanceResponse implements BalanceResponse {
  const factory _BalanceResponse(
      {required final String status,
      required final String message,
      required final int balance}) = _$BalanceResponseImpl;

  factory _BalanceResponse.fromJson(Map<String, dynamic> json) =
      _$BalanceResponseImpl.fromJson;

  @override
  String get status;
  @override
  String get message;
  @override
  int get balance;
  @override
  @JsonKey(ignore: true)
  _$$BalanceResponseImplCopyWith<_$BalanceResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
