// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'custom_link.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomLink _$CustomLinkFromJson(Map<String, dynamic> json) {
  return _CustomLink.fromJson(json);
}

/// @nodoc
mixin _$CustomLink {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'link_icon')
  String? get linkIcon => throw _privateConstructorUsedError;
  @JsonKey(name: 'company_name')
  String? get companyName => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomLinkCopyWith<CustomLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomLinkCopyWith<$Res> {
  factory $CustomLinkCopyWith(
          CustomLink value, $Res Function(CustomLink) then) =
      _$CustomLinkCopyWithImpl<$Res, CustomLink>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'link_icon') String? linkIcon,
      @JsonKey(name: 'company_name') String? companyName,
      String? title,
      String? description,
      String? url,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$CustomLinkCopyWithImpl<$Res, $Val extends CustomLink>
    implements $CustomLinkCopyWith<$Res> {
  _$CustomLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? linkIcon = freezed,
    Object? companyName = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? url = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      linkIcon: freezed == linkIcon
          ? _value.linkIcon
          : linkIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomLinkCopyWith<$Res>
    implements $CustomLinkCopyWith<$Res> {
  factory _$$_CustomLinkCopyWith(
          _$_CustomLink value, $Res Function(_$_CustomLink) then) =
      __$$_CustomLinkCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'link_icon') String? linkIcon,
      @JsonKey(name: 'company_name') String? companyName,
      String? title,
      String? description,
      String? url,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$_CustomLinkCopyWithImpl<$Res>
    extends _$CustomLinkCopyWithImpl<$Res, _$_CustomLink>
    implements _$$_CustomLinkCopyWith<$Res> {
  __$$_CustomLinkCopyWithImpl(
      _$_CustomLink _value, $Res Function(_$_CustomLink) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? linkIcon = freezed,
    Object? companyName = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? url = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_CustomLink(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      linkIcon: freezed == linkIcon
          ? _value.linkIcon
          : linkIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomLink implements _CustomLink {
  _$_CustomLink(
      {this.id,
      @JsonKey(name: 'link_icon') this.linkIcon,
      @JsonKey(name: 'company_name') this.companyName,
      this.title,
      this.description,
      this.url,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$_CustomLink.fromJson(Map<String, dynamic> json) =>
      _$$_CustomLinkFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'link_icon')
  final String? linkIcon;
  @override
  @JsonKey(name: 'company_name')
  final String? companyName;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? url;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'CustomLink(id: $id, linkIcon: $linkIcon, companyName: $companyName, title: $title, description: $description, url: $url, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomLink &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.linkIcon, linkIcon) ||
                other.linkIcon == linkIcon) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, linkIcon, companyName, title,
      description, url, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomLinkCopyWith<_$_CustomLink> get copyWith =>
      __$$_CustomLinkCopyWithImpl<_$_CustomLink>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomLinkToJson(
      this,
    );
  }
}

abstract class _CustomLink implements CustomLink {
  factory _CustomLink(
      {final int? id,
      @JsonKey(name: 'link_icon') final String? linkIcon,
      @JsonKey(name: 'company_name') final String? companyName,
      final String? title,
      final String? description,
      final String? url,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt}) = _$_CustomLink;

  factory _CustomLink.fromJson(Map<String, dynamic> json) =
      _$_CustomLink.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'link_icon')
  String? get linkIcon;
  @override
  @JsonKey(name: 'company_name')
  String? get companyName;
  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get url;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_CustomLinkCopyWith<_$_CustomLink> get copyWith =>
      throw _privateConstructorUsedError;
}
