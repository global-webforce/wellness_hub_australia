// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Schedule _$$_ScheduleFromJson(Map<String, dynamic> json) => _$_Schedule(
      id: json['id'] as int?,
      taskId: json['task_id'] as int?,
      weekdays: json['weekdays'] as String?,
      timeSlots: json['timeSlots'] as String?,
      enabled: json['enabled'] as int?,
    );

Map<String, dynamic> _$$_ScheduleToJson(_$_Schedule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'task_id': instance.taskId,
      'weekdays': instance.weekdays,
      'timeSlots': instance.timeSlots,
      'enabled': instance.enabled,
    };
