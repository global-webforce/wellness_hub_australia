import 'dart:async';
import 'dart:convert';
import 'package:ez_core/ez_core.dart';
import 'package:wellness_hub_australia/app/api/api_service.dart';
import 'package:wellness_hub_australia/app/app_service.dart';
import 'package:wellness_hub_australia/features/pillars/pillars_service.dart';
import 'package:wellness_hub_australia/features/tasks/services/task_service.dart';
import 'package:wellness_hub_australia/app/api/api_endpoints.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/app/models/task.model.dart';
import 'package:stacked/stacked.dart';

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}

class TaskServiceLaravel with ReactiveServiceMixin implements TaskService {
  final _apiService = locator<ApiService>();
  final _appService = locator<AppService>();

  final _pillarService = locator<PillarService>();

  TaskServiceLaravel() {
    listenToReactiveValues([
      _tasks,
    ]);
  }

  final ReactiveValue<List<Task>> _tasks = ReactiveValue<List<Task>>([]);

  @override
  List<Task> get tasks => _tasks.value;

  @override
  Future getAll() async {
    await _apiService.get(
      ApiEndpoints.instance.tasks(),
      onSuccess: (res) async {
        List<dynamic> list = jsonDecode(res.body);
        _tasks.value = list.map((task) => Task.fromJson(task)).toList();
      },
      onError: (_) {},
    );
  }

  @override
  Future toggleProgress(int? taskId) async {
    final task = _tasks.value.safeFirstWhere((e) => e.id == taskId);
    if (task?.taskProgressId != null) {
      await _apiService.delete(
        ApiEndpoints.instance.undoFinishedTask(task?.taskProgressId),
        onSuccess: (res) async {
          tasks[tasks.indexWhere((e) => e.id == taskId)] = tasks
              .firstWhere((e) => e.id == taskId)
              .copyWith(taskProgressId: null);
          notifyListeners();
          await _pillarService.getPillarsProgressOfUser();
        },
        onError: (_) {},
      );
    } else {
      await _apiService.post(
        ApiEndpoints.instance.finishTask(),
        requestBody: {
          "user_id": _appService.user!.id,
          "task_id": task?.id,
          "status": 1,
          "pillar_id": task?.pillarId,
        },
        onSuccess: (res) async {
          tasks[tasks.indexWhere((e) => e.id == taskId)] = tasks
              .firstWhere((e) => e.id == taskId)
              .copyWith(taskProgressId: jsonDecode(res.body)["task_id"]);
          notifyListeners();
          await _pillarService.getPillarsProgressOfUser();
        },
        onError: (_) {},
      );
    }
  }
}
