import 'package:wellness_hub_australia/app/models/appointment.model.dart';
import 'package:stacked/stacked.dart';

abstract class AppointmentsService with ReactiveServiceMixin {
  List<Appointment> get appointments;
  Future getAll();
  Future create(Map<String, dynamic> formData);
  Future update(int? appointmentId, Map<String, dynamic> formData);
}
