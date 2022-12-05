// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_schedule.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServiceSchedule _$$_ServiceScheduleFromJson(Map<String, dynamic> json) =>
    _$_ServiceSchedule(
      id: json['id'] as int?,
      day: json['day'] as String?,
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_ServiceScheduleToJson(_$_ServiceSchedule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'day': instance.day,
      'start_date': instance.startDate?.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'status': instance.status,
    };
