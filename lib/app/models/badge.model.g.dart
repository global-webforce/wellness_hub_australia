// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'badge.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Badge _$$_BadgeFromJson(Map<String, dynamic> json) => _$_Badge(
      id: json['id'] as int?,
      badgeName: json['badge_name'] as String?,
      description: json['description'] as String?,
      imgPath: json['img_path'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      acquired: json['acquired'] as bool? ?? false,
    );

Map<String, dynamic> _$$_BadgeToJson(_$_Badge instance) => <String, dynamic>{
      'id': instance.id,
      'badge_name': instance.badgeName,
      'description': instance.description,
      'img_path': instance.imgPath,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'acquired': instance.acquired,
    };
