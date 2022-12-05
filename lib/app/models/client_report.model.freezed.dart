// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'client_report.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClientReport _$ClientReportFromJson(Map<String, dynamic> json) {
  return _ClientReport.fromJson(json);
}

/// @nodoc
mixin _$ClientReport {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  dynamic get mobile => throw _privateConstructorUsedError;
  dynamic get company => throw _privateConstructorUsedError;
  @JsonKey(name: 'overall_progress')
  String? get overallProgress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientReportCopyWith<ClientReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientReportCopyWith<$Res> {
  factory $ClientReportCopyWith(
          ClientReport value, $Res Function(ClientReport) then) =
      _$ClientReportCopyWithImpl<$Res, ClientReport>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      dynamic mobile,
      dynamic company,
      @JsonKey(name: 'overall_progress') String? overallProgress});
}

/// @nodoc
class _$ClientReportCopyWithImpl<$Res, $Val extends ClientReport>
    implements $ClientReportCopyWith<$Res> {
  _$ClientReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? mobile = null,
    Object? company = null,
    Object? overallProgress = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as dynamic,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as dynamic,
      overallProgress: freezed == overallProgress
          ? _value.overallProgress
          : overallProgress // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ClientReportCopyWith<$Res>
    implements $ClientReportCopyWith<$Res> {
  factory _$$_ClientReportCopyWith(
          _$_ClientReport value, $Res Function(_$_ClientReport) then) =
      __$$_ClientReportCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      dynamic mobile,
      dynamic company,
      @JsonKey(name: 'overall_progress') String? overallProgress});
}

/// @nodoc
class __$$_ClientReportCopyWithImpl<$Res>
    extends _$ClientReportCopyWithImpl<$Res, _$_ClientReport>
    implements _$$_ClientReportCopyWith<$Res> {
  __$$_ClientReportCopyWithImpl(
      _$_ClientReport _value, $Res Function(_$_ClientReport) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? mobile = null,
    Object? company = null,
    Object? overallProgress = freezed,
  }) {
    return _then(_$_ClientReport(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as dynamic,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as dynamic,
      overallProgress: freezed == overallProgress
          ? _value.overallProgress
          : overallProgress // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClientReport implements _ClientReport {
  _$_ClientReport(
      {this.id,
      @JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      this.mobile,
      this.company,
      @JsonKey(name: 'overall_progress') this.overallProgress});

  factory _$_ClientReport.fromJson(Map<String, dynamic> json) =>
      _$$_ClientReportFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  final dynamic mobile;
  @override
  final dynamic company;
  @override
  @JsonKey(name: 'overall_progress')
  final String? overallProgress;

  @override
  String toString() {
    return 'ClientReport(id: $id, firstName: $firstName, lastName: $lastName, mobile: $mobile, company: $company, overallProgress: $overallProgress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClientReport &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            const DeepCollectionEquality().equals(other.mobile, mobile) &&
            const DeepCollectionEquality().equals(other.company, company) &&
            (identical(other.overallProgress, overallProgress) ||
                other.overallProgress == overallProgress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      firstName,
      lastName,
      const DeepCollectionEquality().hash(mobile),
      const DeepCollectionEquality().hash(company),
      overallProgress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClientReportCopyWith<_$_ClientReport> get copyWith =>
      __$$_ClientReportCopyWithImpl<_$_ClientReport>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClientReportToJson(
      this,
    );
  }
}

abstract class _ClientReport implements ClientReport {
  factory _ClientReport(
          {final int? id,
          @JsonKey(name: 'first_name') final String? firstName,
          @JsonKey(name: 'last_name') final String? lastName,
          final dynamic mobile,
          final dynamic company,
          @JsonKey(name: 'overall_progress') final String? overallProgress}) =
      _$_ClientReport;

  factory _ClientReport.fromJson(Map<String, dynamic> json) =
      _$_ClientReport.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  dynamic get mobile;
  @override
  dynamic get company;
  @override
  @JsonKey(name: 'overall_progress')
  String? get overallProgress;
  @override
  @JsonKey(ignore: true)
  _$$_ClientReportCopyWith<_$_ClientReport> get copyWith =>
      throw _privateConstructorUsedError;
}
