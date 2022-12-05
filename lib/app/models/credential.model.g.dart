// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credential.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Credential _$$_CredentialFromJson(Map<String, dynamic> json) =>
    _$_Credential(
      id: json['id'] as int?,
      serviceProviderId: json['service_provider_id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      verified: json['verified'] as int?,
      dateIssued: json['date_issued'],
      attachment: json['attachment'] as String?,
    );

Map<String, dynamic> _$$_CredentialToJson(_$_Credential instance) =>
    <String, dynamic>{
      'id': instance.id,
      'service_provider_id': instance.serviceProviderId,
      'title': instance.title,
      'description': instance.description,
      'verified': instance.verified,
      'date_issued': instance.dateIssued,
      'attachment': instance.attachment,
    };
