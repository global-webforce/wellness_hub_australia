// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pillar_progress.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PillarProgress _$PillarProgressFromJson(Map<String, dynamic> json) {
  return _PillarProgress.fromJson(json);
}

/// @nodoc
mixin _$PillarProgress {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'color_theme')
  String? get colorTheme => throw _privateConstructorUsedError;
  @JsonKey(name: 'pillar_icon')
  String? get pillarIcon => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  int? get completed => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PillarProgressCopyWith<PillarProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PillarProgressCopyWith<$Res> {
  factory $PillarProgressCopyWith(
          PillarProgress value, $Res Function(PillarProgress) then) =
      _$PillarProgressCopyWithImpl<$Res, PillarProgress>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'color_theme') String? colorTheme,
      @JsonKey(name: 'pillar_icon') String? pillarIcon,
      String? title,
      int? completed,
      int? total});
}

/// @nodoc
class _$PillarProgressCopyWithImpl<$Res, $Val extends PillarProgress>
    implements $PillarProgressCopyWith<$Res> {
  _$PillarProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? colorTheme = freezed,
    Object? pillarIcon = freezed,
    Object? title = freezed,
    Object? completed = freezed,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      colorTheme: freezed == colorTheme
          ? _value.colorTheme
          : colorTheme // ignore: cast_nullable_to_non_nullable
              as String?,
      pillarIcon: freezed == pillarIcon
          ? _value.pillarIcon
          : pillarIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PillarProgressCopyWith<$Res>
    implements $PillarProgressCopyWith<$Res> {
  factory _$$_PillarProgressCopyWith(
          _$_PillarProgress value, $Res Function(_$_PillarProgress) then) =
      __$$_PillarProgressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'color_theme') String? colorTheme,
      @JsonKey(name: 'pillar_icon') String? pillarIcon,
      String? title,
      int? completed,
      int? total});
}

/// @nodoc
class __$$_PillarProgressCopyWithImpl<$Res>
    extends _$PillarProgressCopyWithImpl<$Res, _$_PillarProgress>
    implements _$$_PillarProgressCopyWith<$Res> {
  __$$_PillarProgressCopyWithImpl(
      _$_PillarProgress _value, $Res Function(_$_PillarProgress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? colorTheme = freezed,
    Object? pillarIcon = freezed,
    Object? title = freezed,
    Object? completed = freezed,
    Object? total = freezed,
  }) {
    return _then(_$_PillarProgress(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      colorTheme: freezed == colorTheme
          ? _value.colorTheme
          : colorTheme // ignore: cast_nullable_to_non_nullable
              as String?,
      pillarIcon: freezed == pillarIcon
          ? _value.pillarIcon
          : pillarIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PillarProgress implements _PillarProgress {
  _$_PillarProgress(
      {this.id,
      @JsonKey(name: 'color_theme') this.colorTheme,
      @JsonKey(name: 'pillar_icon') this.pillarIcon,
      this.title,
      this.completed,
      this.total});

  factory _$_PillarProgress.fromJson(Map<String, dynamic> json) =>
      _$$_PillarProgressFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'color_theme')
  final String? colorTheme;
  @override
  @JsonKey(name: 'pillar_icon')
  final String? pillarIcon;
  @override
  final String? title;
  @override
  final int? completed;
  @override
  final int? total;

  @override
  String toString() {
    return 'PillarProgress(id: $id, colorTheme: $colorTheme, pillarIcon: $pillarIcon, title: $title, completed: $completed, total: $total)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PillarProgress &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.colorTheme, colorTheme) ||
                other.colorTheme == colorTheme) &&
            (identical(other.pillarIcon, pillarIcon) ||
                other.pillarIcon == pillarIcon) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, colorTheme, pillarIcon, title, completed, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PillarProgressCopyWith<_$_PillarProgress> get copyWith =>
      __$$_PillarProgressCopyWithImpl<_$_PillarProgress>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PillarProgressToJson(
      this,
    );
  }
}

abstract class _PillarProgress implements PillarProgress {
  factory _PillarProgress(
      {final int? id,
      @JsonKey(name: 'color_theme') final String? colorTheme,
      @JsonKey(name: 'pillar_icon') final String? pillarIcon,
      final String? title,
      final int? completed,
      final int? total}) = _$_PillarProgress;

  factory _PillarProgress.fromJson(Map<String, dynamic> json) =
      _$_PillarProgress.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'color_theme')
  String? get colorTheme;
  @override
  @JsonKey(name: 'pillar_icon')
  String? get pillarIcon;
  @override
  String? get title;
  @override
  int? get completed;
  @override
  int? get total;
  @override
  @JsonKey(ignore: true)
  _$$_PillarProgressCopyWith<_$_PillarProgress> get copyWith =>
      throw _privateConstructorUsedError;
}
