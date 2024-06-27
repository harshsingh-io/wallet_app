// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'airdrop_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AirdropResponse _$AirdropResponseFromJson(Map<String, dynamic> json) {
  return _AirdropResponse.fromJson(json);
}

/// @nodoc
mixin _$AirdropResponse {
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AirdropResponseCopyWith<AirdropResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AirdropResponseCopyWith<$Res> {
  factory $AirdropResponseCopyWith(
          AirdropResponse value, $Res Function(AirdropResponse) then) =
      _$AirdropResponseCopyWithImpl<$Res, AirdropResponse>;
  @useResult
  $Res call({String status, String message});
}

/// @nodoc
class _$AirdropResponseCopyWithImpl<$Res, $Val extends AirdropResponse>
    implements $AirdropResponseCopyWith<$Res> {
  _$AirdropResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AirdropResponseImplCopyWith<$Res>
    implements $AirdropResponseCopyWith<$Res> {
  factory _$$AirdropResponseImplCopyWith(_$AirdropResponseImpl value,
          $Res Function(_$AirdropResponseImpl) then) =
      __$$AirdropResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String message});
}

/// @nodoc
class __$$AirdropResponseImplCopyWithImpl<$Res>
    extends _$AirdropResponseCopyWithImpl<$Res, _$AirdropResponseImpl>
    implements _$$AirdropResponseImplCopyWith<$Res> {
  __$$AirdropResponseImplCopyWithImpl(
      _$AirdropResponseImpl _value, $Res Function(_$AirdropResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
  }) {
    return _then(_$AirdropResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AirdropResponseImpl implements _AirdropResponse {
  const _$AirdropResponseImpl({required this.status, required this.message});

  factory _$AirdropResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AirdropResponseImplFromJson(json);

  @override
  final String status;
  @override
  final String message;

  @override
  String toString() {
    return 'AirdropResponse(status: $status, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AirdropResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AirdropResponseImplCopyWith<_$AirdropResponseImpl> get copyWith =>
      __$$AirdropResponseImplCopyWithImpl<_$AirdropResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AirdropResponseImplToJson(
      this,
    );
  }
}

abstract class _AirdropResponse implements AirdropResponse {
  const factory _AirdropResponse(
      {required final String status,
      required final String message}) = _$AirdropResponseImpl;

  factory _AirdropResponse.fromJson(Map<String, dynamic> json) =
      _$AirdropResponseImpl.fromJson;

  @override
  String get status;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$AirdropResponseImplCopyWith<_$AirdropResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
