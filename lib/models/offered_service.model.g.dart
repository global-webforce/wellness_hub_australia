// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offered_service.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OfferedService _$$_OfferedServiceFromJson(Map<String, dynamic> json) =>
    _$_OfferedService(
      id: json['id'] as int?,
      pillarId: json['pillar_id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      serviceProviderId: json['service_provider_id'] as int?,
      fieldId: json['field_id'] as int?,
      ratePerHour: (json['rate_per_hour'] as num?)?.toDouble(),
      verified: json['verified'] as int?,
    );

Map<String, dynamic> _$$_OfferedServiceToJson(_$_OfferedService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pillar_id': instance.pillarId,
      'title': instance.title,
      'description': instance.description,
      'service_provider_id': instance.serviceProviderId,
      'field_id': instance.fieldId,
      'rate_per_hour': instance.ratePerHour,
      'verified': instance.verified,
    };
