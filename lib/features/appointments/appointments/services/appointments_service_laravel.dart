import 'dart:async';
import 'dart:convert';
import 'package:wellness_hub_australia/app/api/api_service.dart';
import 'package:wellness_hub_australia/app/app_service.dart';

import 'package:wellness_hub_australia/app/api/api_endpoints.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/features/appointments/appointments/services/appointments_service.dart';
import 'package:wellness_hub_australia/app/models/appointment.model.dart';
import 'package:stacked/stacked.dart';

class AppointmentsServiceLaravel
    with ReactiveServiceMixin
    implements AppointmentsService {
  final _apiService = locator<ApiService>();
  final _appService = locator<AppService>();

  AppointmentsServiceLaravel() {
    listenToReactiveValues([
      _appointments,
    ]);
  }

  final ReactiveValue<List<Appointment>> _appointments =
      ReactiveValue<List<Appointment>>([]);

  @override
  Future create(Map<String, dynamic> formData) async {
    formData.addAll({
      'user_id': _appService.user?.id,
    });
    await _apiService.post(
      ApiEndpoints.createAppointment,
      requestBody: formData,
      onSuccess: (_) async {
        await getAll();
      },
      onError: (_) {},
    );
    return Future.value("");
  }

  @override
  Future update(int? appointmentId, Map<String, dynamic> formData) async {
    await _apiService.put(
      ApiEndpoints.instance.updateAppointment(appointmentId),
      requestBody: formData,
      onSuccess: (_) async {
        await getAll();
      },
      onError: (_) {},
    );
  }

  @override
  Future getAll() async {
    if (_appService.user?.role == "member") {
      await _apiService.get(
        ApiEndpoints.instance.clientAppointment(),
        onSuccess: (res) async {
          _appointments.value = List<Appointment>.from(
              jsonDecode(res.body).map((model) => Appointment.fromJson(model)));
        },
        onError: (_) {},
      );
    } else if (_appService.user?.role == "service_provider") {
      await _apiService.get(
        ApiEndpoints.instance.serviceProviderAppointment(),
        onSuccess: (res) async {
          _appointments.value = List<Appointment>.from(
              jsonDecode(res.body).map((model) => Appointment.fromJson(model)));
        },
        onError: (_) {},
      );
    }
  }

  @override
  List<Appointment> get appointments => _appointments.value;
}
