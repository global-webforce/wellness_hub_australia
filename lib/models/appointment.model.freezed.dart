// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'appointment.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Appointment _$AppointmentFromJson(Map<String, dynamic> json) {
  return _Appointment.fromJson(json);
}

/// @nodoc
mixin _$Appointment {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  DateTime? get endDate => throw _privateConstructorUsedError;
  double? get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'field_assignment_id')
  int? get fieldAssignmentId => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  int? get paid => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_type')
  String? get paymentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'field_details')
  Field? get fieldDetails => throw _privateConstructorUsedError;
  Client? get member => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_provider')
  ServiceProvider? get serviceProvider => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppointmentCopyWith<Appointment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentCopyWith<$Res> {
  factory $AppointmentCopyWith(
          Appointment value, $Res Function(Appointment) then) =
      _$AppointmentCopyWithImpl<$Res, Appointment>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'start_date') DateTime? startDate,
      @JsonKey(name: 'end_date') DateTime? endDate,
      double? total,
      @JsonKey(name: 'field_assignment_id') int? fieldAssignmentId,
      String? status,
      int? paid,
      @JsonKey(name: 'payment_type') String? paymentType,
      @JsonKey(name: 'field_details') Field? fieldDetails,
      Client? member,
      @JsonKey(name: 'service_provider') ServiceProvider? serviceProvider});

  $FieldCopyWith<$Res>? get fieldDetails;
  $ClientCopyWith<$Res>? get member;
  $ServiceProviderCopyWith<$Res>? get serviceProvider;
}

/// @nodoc
class _$AppointmentCopyWithImpl<$Res, $Val extends Appointment>
    implements $AppointmentCopyWith<$Res> {
  _$AppointmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? total = freezed,
    Object? fieldAssignmentId = freezed,
    Object? status = freezed,
    Object? paid = freezed,
    Object? paymentType = freezed,
    Object? fieldDetails = freezed,
    Object? member = freezed,
    Object? serviceProvider = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
      fieldAssignmentId: freezed == fieldAssignmentId
          ? _value.fieldAssignmentId
          : fieldAssignmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      paid: freezed == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentType: freezed == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String?,
      fieldDetails: freezed == fieldDetails
          ? _value.fieldDetails
          : fieldDetails // ignore: cast_nullable_to_non_nullable
              as Field?,
      member: freezed == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as Client?,
      serviceProvider: freezed == serviceProvider
          ? _value.serviceProvider
          : serviceProvider // ignore: cast_nullable_to_non_nullable
              as ServiceProvider?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<$Res>? get fieldDetails {
    if (_value.fieldDetails == null) {
      return null;
    }

    return $FieldCopyWith<$Res>(_value.fieldDetails!, (value) {
      return _then(_value.copyWith(fieldDetails: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ClientCopyWith<$Res>? get member {
    if (_value.member == null) {
      return null;
    }

    return $ClientCopyWith<$Res>(_value.member!, (value) {
      return _then(_value.copyWith(member: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ServiceProviderCopyWith<$Res>? get serviceProvider {
    if (_value.serviceProvider == null) {
      return null;
    }

    return $ServiceProviderCopyWith<$Res>(_value.serviceProvider!, (value) {
      return _then(_value.copyWith(serviceProvider: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AppointmentCopyWith<$Res>
    implements $AppointmentCopyWith<$Res> {
  factory _$$_AppointmentCopyWith(
          _$_Appointment value, $Res Function(_$_Appointment) then) =
      __$$_AppointmentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'start_date') DateTime? startDate,
      @JsonKey(name: 'end_date') DateTime? endDate,
      double? total,
      @JsonKey(name: 'field_assignment_id') int? fieldAssignmentId,
      String? status,
      int? paid,
      @JsonKey(name: 'payment_type') String? paymentType,
      @JsonKey(name: 'field_details') Field? fieldDetails,
      Client? member,
      @JsonKey(name: 'service_provider') ServiceProvider? serviceProvider});

  @override
  $FieldCopyWith<$Res>? get fieldDetails;
  @override
  $ClientCopyWith<$Res>? get member;
  @override
  $ServiceProviderCopyWith<$Res>? get serviceProvider;
}

/// @nodoc
class __$$_AppointmentCopyWithImpl<$Res>
    extends _$AppointmentCopyWithImpl<$Res, _$_Appointment>
    implements _$$_AppointmentCopyWith<$Res> {
  __$$_AppointmentCopyWithImpl(
      _$_Appointment _value, $Res Function(_$_Appointment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? total = freezed,
    Object? fieldAssignmentId = freezed,
    Object? status = freezed,
    Object? paid = freezed,
    Object? paymentType = freezed,
    Object? fieldDetails = freezed,
    Object? member = freezed,
    Object? serviceProvider = freezed,
  }) {
    return _then(_$_Appointment(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
      fieldAssignmentId: freezed == fieldAssignmentId
          ? _value.fieldAssignmentId
          : fieldAssignmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      paid: freezed == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentType: freezed == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String?,
      fieldDetails: freezed == fieldDetails
          ? _value.fieldDetails
          : fieldDetails // ignore: cast_nullable_to_non_nullable
              as Field?,
      member: freezed == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as Client?,
      serviceProvider: freezed == serviceProvider
          ? _value.serviceProvider
          : serviceProvider // ignore: cast_nullable_to_non_nullable
              as ServiceProvider?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Appointment implements _Appointment {
  _$_Appointment(
      {this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'start_date') this.startDate,
      @JsonKey(name: 'end_date') this.endDate,
      this.total,
      @JsonKey(name: 'field_assignment_id') this.fieldAssignmentId,
      this.status,
      this.paid,
      @JsonKey(name: 'payment_type') this.paymentType,
      @JsonKey(name: 'field_details') this.fieldDetails,
      this.member,
      @JsonKey(name: 'service_provider') this.serviceProvider});

  factory _$_Appointment.fromJson(Map<String, dynamic> json) =>
      _$$_AppointmentFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'start_date')
  final DateTime? startDate;
  @override
  @JsonKey(name: 'end_date')
  final DateTime? endDate;
  @override
  final double? total;
  @override
  @JsonKey(name: 'field_assignment_id')
  final int? fieldAssignmentId;
  @override
  final String? status;
  @override
  final int? paid;
  @override
  @JsonKey(name: 'payment_type')
  final String? paymentType;
  @override
  @JsonKey(name: 'field_details')
  final Field? fieldDetails;
  @override
  final Client? member;
  @override
  @JsonKey(name: 'service_provider')
  final ServiceProvider? serviceProvider;

  @override
  String toString() {
    return 'Appointment(id: $id, userId: $userId, startDate: $startDate, endDate: $endDate, total: $total, fieldAssignmentId: $fieldAssignmentId, status: $status, paid: $paid, paymentType: $paymentType, fieldDetails: $fieldDetails, member: $member, serviceProvider: $serviceProvider)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Appointment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.fieldAssignmentId, fieldAssignmentId) ||
                other.fieldAssignmentId == fieldAssignmentId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paid, paid) || other.paid == paid) &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType) &&
            (identical(other.fieldDetails, fieldDetails) ||
                other.fieldDetails == fieldDetails) &&
            (identical(other.member, member) || other.member == member) &&
            (identical(other.serviceProvider, serviceProvider) ||
                other.serviceProvider == serviceProvider));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      startDate,
      endDate,
      total,
      fieldAssignmentId,
      status,
      paid,
      paymentType,
      fieldDetails,
      member,
      serviceProvider);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppointmentCopyWith<_$_Appointment> get copyWith =>
      __$$_AppointmentCopyWithImpl<_$_Appointment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppointmentToJson(
      this,
    );
  }
}

abstract class _Appointment implements Appointment {
  factory _Appointment(
      {final int? id,
      @JsonKey(name: 'user_id')
          final int? userId,
      @JsonKey(name: 'start_date')
          final DateTime? startDate,
      @JsonKey(name: 'end_date')
          final DateTime? endDate,
      final double? total,
      @JsonKey(name: 'field_assignment_id')
          final int? fieldAssignmentId,
      final String? status,
      final int? paid,
      @JsonKey(name: 'payment_type')
          final String? paymentType,
      @JsonKey(name: 'field_details')
          final Field? fieldDetails,
      final Client? member,
      @JsonKey(name: 'service_provider')
          final ServiceProvider? serviceProvider}) = _$_Appointment;

  factory _Appointment.fromJson(Map<String, dynamic> json) =
      _$_Appointment.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'start_date')
  DateTime? get startDate;
  @override
  @JsonKey(name: 'end_date')
  DateTime? get endDate;
  @override
  double? get total;
  @override
  @JsonKey(name: 'field_assignment_id')
  int? get fieldAssignmentId;
  @override
  String? get status;
  @override
  int? get paid;
  @override
  @JsonKey(name: 'payment_type')
  String? get paymentType;
  @override
  @JsonKey(name: 'field_details')
  Field? get fieldDetails;
  @override
  Client? get member;
  @override
  @JsonKey(name: 'service_provider')
  ServiceProvider? get serviceProvider;
  @override
  @JsonKey(ignore: true)
  _$$_AppointmentCopyWith<_$_Appointment> get copyWith =>
      throw _privateConstructorUsedError;
}
