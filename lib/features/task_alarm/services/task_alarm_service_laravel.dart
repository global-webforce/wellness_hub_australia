import 'dart:async';
import 'package:wellness_hub_australia/app/api/api_service.dart';
import 'package:wellness_hub_australia/app/app_service.dart';
import 'package:wellness_hub_australia/features/task_alarm/services/task_alarm_service.dart';
import 'package:wellness_hub_australia/features/tasks/services/task_service.dart';
import 'package:wellness_hub_australia/app/api/api_endpoints.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';

class TaskAlarmServiceLaravel implements TaskAlarmService {
  final _apiService = locator<ApiService>();
  final _taskService = locator<TaskService>();
  final _appService = locator<AppService>();

  @override
  Future<void> create(Map<String, dynamic> formValue) async {
    Map<String, dynamic> rawFormData = Map.of(formValue);
    rawFormData.addAll({'user_id': _appService.user!.id});

    await _apiService.post(
      ApiEndpoints.instance.addAlarm(),
      requestBody: rawFormData,
      onSuccess: (res) async {
        await _taskService.getAll();
      },
      onError: (_) {},
    );
  }

  @override
  Future<void> update(Map<String, dynamic> formValue) async {
    Map<String, dynamic> rawFormData = Map.of(formValue);
    rawFormData.addAll({'user_id': _appService.user!.id});
    await _apiService.put(
      ApiEndpoints.instance.updateAlarm(rawFormData["id"]),
      requestBody: rawFormData,
      onSuccess: (res) async {
        await _taskService.getAll();
      },
      onError: (_) {},
    );
  }

  @override
  Future<void> delete(int? id) async {
    await _apiService.delete(
      ApiEndpoints.instance.deleteAlarm(id),
      onSuccess: (res) async {
        await _taskService.getAll();
      },
      onError: (_) {},
    );
  }
}
