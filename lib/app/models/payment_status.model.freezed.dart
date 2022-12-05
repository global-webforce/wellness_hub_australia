// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'payment_status.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentStatus _$PaymentStatusFromJson(Map<String, dynamic> json) {
  return _PaymentStatus.fromJson(json);
}

/// @nodoc
mixin _$PaymentStatus {
  String? get type => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_date')
  dynamic get paymentDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'refund_date')
  dynamic get refundDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentStatusCopyWith<PaymentStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentStatusCopyWith<$Res> {
  factory $PaymentStatusCopyWith(
          PaymentStatus value, $Res Function(PaymentStatus) then) =
      _$PaymentStatusCopyWithImpl<$Res, PaymentStatus>;
  @useResult
  $Res call(
      {String? type,
      double? amount,
      @JsonKey(name: 'payment_date') dynamic paymentDate,
      @JsonKey(name: 'refund_date') dynamic refundDate});
}

/// @nodoc
class _$PaymentStatusCopyWithImpl<$Res, $Val extends PaymentStatus>
    implements $PaymentStatusCopyWith<$Res> {
  _$PaymentStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? amount = freezed,
    Object? paymentDate = null,
    Object? refundDate = null,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      paymentDate: null == paymentDate
          ? _value.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      refundDate: null == refundDate
          ? _value.refundDate
          : refundDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentStatusCopyWith<$Res>
    implements $PaymentStatusCopyWith<$Res> {
  factory _$$_PaymentStatusCopyWith(
          _$_PaymentStatus value, $Res Function(_$_PaymentStatus) then) =
      __$$_PaymentStatusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? type,
      double? amount,
      @JsonKey(name: 'payment_date') dynamic paymentDate,
      @JsonKey(name: 'refund_date') dynamic refundDate});
}

/// @nodoc
class __$$_PaymentStatusCopyWithImpl<$Res>
    extends _$PaymentStatusCopyWithImpl<$Res, _$_PaymentStatus>
    implements _$$_PaymentStatusCopyWith<$Res> {
  __$$_PaymentStatusCopyWithImpl(
      _$_PaymentStatus _value, $Res Function(_$_PaymentStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? amount = freezed,
    Object? paymentDate = null,
    Object? refundDate = null,
  }) {
    return _then(_$_PaymentStatus(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      paymentDate: null == paymentDate
          ? _value.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      refundDate: null == refundDate
          ? _value.refundDate
          : refundDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentStatus implements _PaymentStatus {
  _$_PaymentStatus(
      {this.type,
      this.amount,
      @JsonKey(name: 'payment_date') this.paymentDate,
      @JsonKey(name: 'refund_date') this.refundDate});

  factory _$_PaymentStatus.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentStatusFromJson(json);

  @override
  final String? type;
  @override
  final double? amount;
  @override
  @JsonKey(name: 'payment_date')
  final dynamic paymentDate;
  @override
  @JsonKey(name: 'refund_date')
  final dynamic refundDate;

  @override
  String toString() {
    return 'PaymentStatus(type: $type, amount: $amount, paymentDate: $paymentDate, refundDate: $refundDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentStatus &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            const DeepCollectionEquality()
                .equals(other.paymentDate, paymentDate) &&
            const DeepCollectionEquality()
                .equals(other.refundDate, refundDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      amount,
      const DeepCollectionEquality().hash(paymentDate),
      const DeepCollectionEquality().hash(refundDate));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentStatusCopyWith<_$_PaymentStatus> get copyWith =>
      __$$_PaymentStatusCopyWithImpl<_$_PaymentStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentStatusToJson(
      this,
    );
  }
}

abstract class _PaymentStatus implements PaymentStatus {
  factory _PaymentStatus(
          {final String? type,
          final double? amount,
          @JsonKey(name: 'payment_date') final dynamic paymentDate,
          @JsonKey(name: 'refund_date') final dynamic refundDate}) =
      _$_PaymentStatus;

  factory _PaymentStatus.fromJson(Map<String, dynamic> json) =
      _$_PaymentStatus.fromJson;

  @override
  String? get type;
  @override
  double? get amount;
  @override
  @JsonKey(name: 'payment_date')
  dynamic get paymentDate;
  @override
  @JsonKey(name: 'refund_date')
  dynamic get refundDate;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentStatusCopyWith<_$_PaymentStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
