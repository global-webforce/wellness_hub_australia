// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_report.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClientReport _$$_ClientReportFromJson(Map<String, dynamic> json) =>
    _$_ClientReport(
      id: json['id'] as int?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      mobile: json['mobile'],
      company: json['company'],
      overallProgress: json['overall_progress'] as String?,
    );

Map<String, dynamic> _$$_ClientReportToJson(_$_ClientReport instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'mobile': instance.mobile,
      'company': instance.company,
      'overall_progress': instance.overallProgress,
    };
