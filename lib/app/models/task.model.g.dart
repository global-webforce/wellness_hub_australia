// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Task _$$_TaskFromJson(Map<String, dynamic> json) => _$_Task(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      pillarId: json['pillar_id'] as int?,
      embedUrl: json['embed_url'] as String?,
      frequency: json['frequency'] as String?,
      imgUrl: json['imgURL'] as String?,
      taskProgressId: json['task_progress_id'] as int?,
      isFavorite: json['isFavorite'] as bool?,
      schedule: json['schedule'] == null
          ? null
          : Schedule.fromJson(json['schedule'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TaskToJson(_$_Task instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'pillar_id': instance.pillarId,
      'embed_url': instance.embedUrl,
      'frequency': instance.frequency,
      'imgURL': instance.imgUrl,
      'task_progress_id': instance.taskProgressId,
      'isFavorite': instance.isFavorite,
      'schedule': instance.schedule,
    };
