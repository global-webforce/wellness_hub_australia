// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Appointment _$$_AppointmentFromJson(Map<String, dynamic> json) =>
    _$_Appointment(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      total: (json['total'] as num?)?.toDouble(),
      fieldAssignmentId: json['field_assignment_id'] as int?,
      status: json['status'] as String?,
      paid: json['paid'] as int?,
      paymentType: json['payment_type'] as String?,
      fieldDetails: json['field_details'] == null
          ? null
          : Field.fromJson(json['field_details'] as Map<String, dynamic>),
      member: json['member'] == null
          ? null
          : Client.fromJson(json['member'] as Map<String, dynamic>),
      serviceProvider: json['service_provider'] == null
          ? null
          : ServiceProvider.fromJson(
              json['service_provider'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AppointmentToJson(_$_Appointment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'start_date': instance.startDate?.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'total': instance.total,
      'field_assignment_id': instance.fieldAssignmentId,
      'status': instance.status,
      'paid': instance.paid,
      'payment_type': instance.paymentType,
      'field_details': instance.fieldDetails,
      'member': instance.member,
      'service_provider': instance.serviceProvider,
    };
