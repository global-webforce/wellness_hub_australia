import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'client.model.dart';
import 'field.model.dart';
import 'service_provider.model.dart';

part 'appointment.model.freezed.dart';
part 'appointment.model.g.dart';

@freezed
class Appointment with _$Appointment {
  factory Appointment({
    int? id,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'start_date') DateTime? startDate,
    @JsonKey(name: 'end_date') DateTime? endDate,
    double? total,
    @JsonKey(name: 'field_assignment_id') int? fieldAssignmentId,
    String? status,
    int? paid,
    @JsonKey(name: 'payment_type') String? paymentType,
    @JsonKey(name: 'field_details') Field? fieldDetails,
    Client? member,
    @JsonKey(name: 'service_provider') ServiceProvider? serviceProvider,
    @JsonKey(name: 'is_editable') bool? isEditable,
  }) = _Appointment;

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);
}
