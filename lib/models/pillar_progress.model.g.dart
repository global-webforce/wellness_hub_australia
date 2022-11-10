// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pillar_progress.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PillarProgress _$$_PillarProgressFromJson(Map<String, dynamic> json) =>
    _$_PillarProgress(
      id: json['id'] as int,
      colorTheme: json['color_theme'] as String?,
      pillarIcon: json['pillar_icon'] as String?,
      title: json['title'] as String?,
      completed: json['completed'] as int?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$$_PillarProgressToJson(_$_PillarProgress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'color_theme': instance.colorTheme,
      'pillar_icon': instance.pillarIcon,
      'title': instance.title,
      'completed': instance.completed,
      'total': instance.total,
    };
