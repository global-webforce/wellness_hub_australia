// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'credential.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Credential _$CredentialFromJson(Map<String, dynamic> json) {
  return _Credential.fromJson(json);
}

/// @nodoc
mixin _$Credential {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_provider_id')
  int? get serviceProviderId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get verified => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_issued')
  dynamic get dateIssued => throw _privateConstructorUsedError;
  String? get attachment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CredentialCopyWith<Credential> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CredentialCopyWith<$Res> {
  factory $CredentialCopyWith(
          Credential value, $Res Function(Credential) then) =
      _$CredentialCopyWithImpl<$Res, Credential>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'service_provider_id') int? serviceProviderId,
      String? title,
      String? description,
      int? verified,
      @JsonKey(name: 'date_issued') dynamic dateIssued,
      String? attachment});
}

/// @nodoc
class _$CredentialCopyWithImpl<$Res, $Val extends Credential>
    implements $CredentialCopyWith<$Res> {
  _$CredentialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? serviceProviderId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? verified = freezed,
    Object? dateIssued = null,
    Object? attachment = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      serviceProviderId: freezed == serviceProviderId
          ? _value.serviceProviderId
          : serviceProviderId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      verified: freezed == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as int?,
      dateIssued: null == dateIssued
          ? _value.dateIssued
          : dateIssued // ignore: cast_nullable_to_non_nullable
              as dynamic,
      attachment: freezed == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CredentialCopyWith<$Res>
    implements $CredentialCopyWith<$Res> {
  factory _$$_CredentialCopyWith(
          _$_Credential value, $Res Function(_$_Credential) then) =
      __$$_CredentialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'service_provider_id') int? serviceProviderId,
      String? title,
      String? description,
      int? verified,
      @JsonKey(name: 'date_issued') dynamic dateIssued,
      String? attachment});
}

/// @nodoc
class __$$_CredentialCopyWithImpl<$Res>
    extends _$CredentialCopyWithImpl<$Res, _$_Credential>
    implements _$$_CredentialCopyWith<$Res> {
  __$$_CredentialCopyWithImpl(
      _$_Credential _value, $Res Function(_$_Credential) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? serviceProviderId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? verified = freezed,
    Object? dateIssued = null,
    Object? attachment = freezed,
  }) {
    return _then(_$_Credential(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      serviceProviderId: freezed == serviceProviderId
          ? _value.serviceProviderId
          : serviceProviderId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      verified: freezed == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as int?,
      dateIssued: null == dateIssued
          ? _value.dateIssued
          : dateIssued // ignore: cast_nullable_to_non_nullable
              as dynamic,
      attachment: freezed == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Credential implements _Credential {
  _$_Credential(
      {this.id,
      @JsonKey(name: 'service_provider_id') this.serviceProviderId,
      this.title,
      this.description,
      this.verified,
      @JsonKey(name: 'date_issued') this.dateIssued,
      this.attachment});

  factory _$_Credential.fromJson(Map<String, dynamic> json) =>
      _$$_CredentialFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'service_provider_id')
  final int? serviceProviderId;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final int? verified;
  @override
  @JsonKey(name: 'date_issued')
  final dynamic dateIssued;
  @override
  final String? attachment;

  @override
  String toString() {
    return 'Credential(id: $id, serviceProviderId: $serviceProviderId, title: $title, description: $description, verified: $verified, dateIssued: $dateIssued, attachment: $attachment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Credential &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.serviceProviderId, serviceProviderId) ||
                other.serviceProviderId == serviceProviderId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            const DeepCollectionEquality()
                .equals(other.dateIssued, dateIssued) &&
            (identical(other.attachment, attachment) ||
                other.attachment == attachment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      serviceProviderId,
      title,
      description,
      verified,
      const DeepCollectionEquality().hash(dateIssued),
      attachment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CredentialCopyWith<_$_Credential> get copyWith =>
      __$$_CredentialCopyWithImpl<_$_Credential>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CredentialToJson(
      this,
    );
  }
}

abstract class _Credential implements Credential {
  factory _Credential(
      {final int? id,
      @JsonKey(name: 'service_provider_id') final int? serviceProviderId,
      final String? title,
      final String? description,
      final int? verified,
      @JsonKey(name: 'date_issued') final dynamic dateIssued,
      final String? attachment}) = _$_Credential;

  factory _Credential.fromJson(Map<String, dynamic> json) =
      _$_Credential.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'service_provider_id')
  int? get serviceProviderId;
  @override
  String? get title;
  @override
  String? get description;
  @override
  int? get verified;
  @override
  @JsonKey(name: 'date_issued')
  dynamic get dateIssued;
  @override
  String? get attachment;
  @override
  @JsonKey(ignore: true)
  _$$_CredentialCopyWith<_$_Credential> get copyWith =>
      throw _privateConstructorUsedError;
}
