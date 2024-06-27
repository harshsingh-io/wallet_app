// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_balance_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransferBalanceResponse _$TransferBalanceResponseFromJson(
    Map<String, dynamic> json) {
  return _TransferBalanceResponse.fromJson(json);
}

/// @nodoc
mixin _$TransferBalanceResponse {
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get transactionId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransferBalanceResponseCopyWith<TransferBalanceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferBalanceResponseCopyWith<$Res> {
  factory $TransferBalanceResponseCopyWith(TransferBalanceResponse value,
          $Res Function(TransferBalanceResponse) then) =
      _$TransferBalanceResponseCopyWithImpl<$Res, TransferBalanceResponse>;
  @useResult
  $Res call({String status, String message, String transactionId});
}

/// @nodoc
class _$TransferBalanceResponseCopyWithImpl<$Res,
        $Val extends TransferBalanceResponse>
    implements $TransferBalanceResponseCopyWith<$Res> {
  _$TransferBalanceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? transactionId = null,
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
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransferBalanceResponseImplCopyWith<$Res>
    implements $TransferBalanceResponseCopyWith<$Res> {
  factory _$$TransferBalanceResponseImplCopyWith(
          _$TransferBalanceResponseImpl value,
          $Res Function(_$TransferBalanceResponseImpl) then) =
      __$$TransferBalanceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String message, String transactionId});
}

/// @nodoc
class __$$TransferBalanceResponseImplCopyWithImpl<$Res>
    extends _$TransferBalanceResponseCopyWithImpl<$Res,
        _$TransferBalanceResponseImpl>
    implements _$$TransferBalanceResponseImplCopyWith<$Res> {
  __$$TransferBalanceResponseImplCopyWithImpl(
      _$TransferBalanceResponseImpl _value,
      $Res Function(_$TransferBalanceResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? transactionId = null,
  }) {
    return _then(_$TransferBalanceResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransferBalanceResponseImpl implements _TransferBalanceResponse {
  const _$TransferBalanceResponseImpl(
      {required this.status,
      required this.message,
      required this.transactionId});

  factory _$TransferBalanceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransferBalanceResponseImplFromJson(json);

  @override
  final String status;
  @override
  final String message;
  @override
  final String transactionId;

  @override
  String toString() {
    return 'TransferBalanceResponse(status: $status, message: $message, transactionId: $transactionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferBalanceResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, transactionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferBalanceResponseImplCopyWith<_$TransferBalanceResponseImpl>
      get copyWith => __$$TransferBalanceResponseImplCopyWithImpl<
          _$TransferBalanceResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransferBalanceResponseImplToJson(
      this,
    );
  }
}

abstract class _TransferBalanceResponse implements TransferBalanceResponse {
  const factory _TransferBalanceResponse(
      {required final String status,
      required final String message,
      required final String transactionId}) = _$TransferBalanceResponseImpl;

  factory _TransferBalanceResponse.fromJson(Map<String, dynamic> json) =
      _$TransferBalanceResponseImpl.fromJson;

  @override
  String get status;
  @override
  String get message;
  @override
  String get transactionId;
  @override
  @JsonKey(ignore: true)
  _$$TransferBalanceResponseImplCopyWith<_$TransferBalanceResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
