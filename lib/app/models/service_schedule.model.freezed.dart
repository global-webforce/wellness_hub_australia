// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'service_schedule.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServiceSchedule _$ServiceScheduleFromJson(Map<String, dynamic> json) {
  return _ServiceSchedule.fromJson(json);
}

/// @nodoc
mixin _$ServiceSchedule {
  int? get id => throw _privateConstructorUsedError;
  String? get day => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  DateTime? get endDate => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceScheduleCopyWith<ServiceSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceScheduleCopyWith<$Res> {
  factory $ServiceScheduleCopyWith(
          ServiceSchedule value, $Res Function(ServiceSchedule) then) =
      _$ServiceScheduleCopyWithImpl<$Res, ServiceSchedule>;
  @useResult
  $Res call(
      {int? id,
      String? day,
      @JsonKey(name: 'start_date') DateTime? startDate,
      @JsonKey(name: 'end_date') DateTime? endDate,
      String? status});
}

/// @nodoc
class _$ServiceScheduleCopyWithImpl<$Res, $Val extends ServiceSchedule>
    implements $ServiceScheduleCopyWith<$Res> {
  _$ServiceScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? day = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ServiceScheduleCopyWith<$Res>
    implements $ServiceScheduleCopyWith<$Res> {
  factory _$$_ServiceScheduleCopyWith(
          _$_ServiceSchedule value, $Res Function(_$_ServiceSchedule) then) =
      __$$_ServiceScheduleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? day,
      @JsonKey(name: 'start_date') DateTime? startDate,
      @JsonKey(name: 'end_date') DateTime? endDate,
      String? status});
}

/// @nodoc
class __$$_ServiceScheduleCopyWithImpl<$Res>
    extends _$ServiceScheduleCopyWithImpl<$Res, _$_ServiceSchedule>
    implements _$$_ServiceScheduleCopyWith<$Res> {
  __$$_ServiceScheduleCopyWithImpl(
      _$_ServiceSchedule _value, $Res Function(_$_ServiceSchedule) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? day = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_ServiceSchedule(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceSchedule implements _ServiceSchedule {
  _$_ServiceSchedule(
      {this.id,
      this.day,
      @JsonKey(name: 'start_date') this.startDate,
      @JsonKey(name: 'end_date') this.endDate,
      this.status});

  factory _$_ServiceSchedule.fromJson(Map<String, dynamic> json) =>
      _$$_ServiceScheduleFromJson(json);

  @override
  final int? id;
  @override
  final String? day;
  @override
  @JsonKey(name: 'start_date')
  final DateTime? startDate;
  @override
  @JsonKey(name: 'end_date')
  final DateTime? endDate;
  @override
  final String? status;

  @override
  String toString() {
    return 'ServiceSchedule(id: $id, day: $day, startDate: $startDate, endDate: $endDate, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServiceSchedule &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, day, startDate, endDate, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServiceScheduleCopyWith<_$_ServiceSchedule> get copyWith =>
      __$$_ServiceScheduleCopyWithImpl<_$_ServiceSchedule>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceScheduleToJson(
      this,
    );
  }
}

abstract class _ServiceSchedule implements ServiceSchedule {
  factory _ServiceSchedule(
      {final int? id,
      final String? day,
      @JsonKey(name: 'start_date') final DateTime? startDate,
      @JsonKey(name: 'end_date') final DateTime? endDate,
      final String? status}) = _$_ServiceSchedule;

  factory _ServiceSchedule.fromJson(Map<String, dynamic> json) =
      _$_ServiceSchedule.fromJson;

  @override
  int? get id;
  @override
  String? get day;
  @override
  @JsonKey(name: 'start_date')
  DateTime? get startDate;
  @override
  @JsonKey(name: 'end_date')
  DateTime? get endDate;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$_ServiceScheduleCopyWith<_$_ServiceSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}
