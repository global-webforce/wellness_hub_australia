import 'dart:async';
import 'dart:convert';
import 'package:wellness_hub_australia/app/api/api_service.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/features/service_schedules/services/service_schedule_service.dart';
import 'package:wellness_hub_australia/app/api/api_endpoints.dart';
import 'package:wellness_hub_australia/models/service_schedule.model.dart';
import 'package:stacked/stacked.dart';

class ServiceSchedulesServiceLaravel
    with ReactiveServiceMixin
    implements ServiceSchedulesService {
  final _apiService = locator<ApiService>();

  ServiceSchedulesServiceLaravel() {
    listenToReactiveValues([
      _serviceSchedules,
    ]);
  }

  final ReactiveValue<List<ServiceSchedule>> _serviceSchedules =
      ReactiveValue<List<ServiceSchedule>>([]);

  @override
  Future create(Map<String, dynamic> formData) async {
    await _apiService.post(
      ApiEndpoints.instance.addSchedule(),
      requestBody: formData,
      onSuccess: (res) async {
        await getAll();
      },
      onError: (_) {},
    );
  }

  @override
  Future update(Map<String, dynamic> formData) async {
    await _apiService.post(
      ApiEndpoints.instance.updateSchedule(),
      requestBody: formData,
      onSuccess: (res) async {
        await getAll();
      },
      onError: (_) {},
    );
  }

  @override
  Future delete(int? id) async {
    await _apiService.delete(
      ApiEndpoints.instance.deleteSchedule(id),
      onSuccess: (res) async {
        await getAll();
      },
      onError: (_) {},
    );
  }

  @override
  Future getAll() async {
    await _apiService.get(
      ApiEndpoints.instance.schedules(),
      onSuccess: (res) async {
        _serviceSchedules.value = List<ServiceSchedule>.from(
            jsonDecode(res.body)
                .map((model) => ServiceSchedule.fromJson(model)));
      },
      onError: (_) {},
    );
  }

  @override
  List<ServiceSchedule> get serviceSchedules => _serviceSchedules.value;
}
