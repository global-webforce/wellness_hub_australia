// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Field _$$_FieldFromJson(Map<String, dynamic> json) => _$_Field(
      id: json['id'] as int?,
      pillarId: json['pillar_id'] as int?,
      title: json['title'] as String?,
      icon: json['icon'],
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$_FieldToJson(_$_Field instance) => <String, dynamic>{
      'id': instance.id,
      'pillar_id': instance.pillarId,
      'title': instance.title,
      'icon': instance.icon,
      'description': instance.description,
    };
