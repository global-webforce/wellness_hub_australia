// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pillar.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Pillar _$PillarFromJson(Map<String, dynamic> json) {
  return _Pillar.fromJson(json);
}

/// @nodoc
mixin _$Pillar {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'color_theme')
  String? get colorTheme => throw _privateConstructorUsedError;
  @JsonKey(name: 'pillar_icon')
  String? get pillarIcon => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PillarCopyWith<Pillar> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PillarCopyWith<$Res> {
  factory $PillarCopyWith(Pillar value, $Res Function(Pillar) then) =
      _$PillarCopyWithImpl<$Res, Pillar>;
  @useResult
  $Res call(
      {int? id,
      String? title,
      @JsonKey(name: 'color_theme') String? colorTheme,
      @JsonKey(name: 'pillar_icon') String? pillarIcon,
      String? description});
}

/// @nodoc
class _$PillarCopyWithImpl<$Res, $Val extends Pillar>
    implements $PillarCopyWith<$Res> {
  _$PillarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? colorTheme = freezed,
    Object? pillarIcon = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      colorTheme: freezed == colorTheme
          ? _value.colorTheme
          : colorTheme // ignore: cast_nullable_to_non_nullable
              as String?,
      pillarIcon: freezed == pillarIcon
          ? _value.pillarIcon
          : pillarIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PillarCopyWith<$Res> implements $PillarCopyWith<$Res> {
  factory _$$_PillarCopyWith(_$_Pillar value, $Res Function(_$_Pillar) then) =
      __$$_PillarCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      @JsonKey(name: 'color_theme') String? colorTheme,
      @JsonKey(name: 'pillar_icon') String? pillarIcon,
      String? description});
}

/// @nodoc
class __$$_PillarCopyWithImpl<$Res>
    extends _$PillarCopyWithImpl<$Res, _$_Pillar>
    implements _$$_PillarCopyWith<$Res> {
  __$$_PillarCopyWithImpl(_$_Pillar _value, $Res Function(_$_Pillar) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? colorTheme = freezed,
    Object? pillarIcon = freezed,
    Object? description = freezed,
  }) {
    return _then(_$_Pillar(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      colorTheme: freezed == colorTheme
          ? _value.colorTheme
          : colorTheme // ignore: cast_nullable_to_non_nullable
              as String?,
      pillarIcon: freezed == pillarIcon
          ? _value.pillarIcon
          : pillarIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Pillar implements _Pillar {
  _$_Pillar(
      {this.id,
      this.title,
      @JsonKey(name: 'color_theme') this.colorTheme,
      @JsonKey(name: 'pillar_icon') this.pillarIcon,
      this.description});

  factory _$_Pillar.fromJson(Map<String, dynamic> json) =>
      _$$_PillarFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  @JsonKey(name: 'color_theme')
  final String? colorTheme;
  @override
  @JsonKey(name: 'pillar_icon')
  final String? pillarIcon;
  @override
  final String? description;

  @override
  String toString() {
    return 'Pillar(id: $id, title: $title, colorTheme: $colorTheme, pillarIcon: $pillarIcon, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Pillar &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.colorTheme, colorTheme) ||
                other.colorTheme == colorTheme) &&
            (identical(other.pillarIcon, pillarIcon) ||
                other.pillarIcon == pillarIcon) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, colorTheme, pillarIcon, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PillarCopyWith<_$_Pillar> get copyWith =>
      __$$_PillarCopyWithImpl<_$_Pillar>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PillarToJson(
      this,
    );
  }
}

abstract class _Pillar implements Pillar {
  factory _Pillar(
      {final int? id,
      final String? title,
      @JsonKey(name: 'color_theme') final String? colorTheme,
      @JsonKey(name: 'pillar_icon') final String? pillarIcon,
      final String? description}) = _$_Pillar;

  factory _Pillar.fromJson(Map<String, dynamic> json) = _$_Pillar.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  @JsonKey(name: 'color_theme')
  String? get colorTheme;
  @override
  @JsonKey(name: 'pillar_icon')
  String? get pillarIcon;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$_PillarCopyWith<_$_Pillar> get copyWith =>
      throw _privateConstructorUsedError;
}
