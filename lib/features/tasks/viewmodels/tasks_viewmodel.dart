import 'dart:async';
import 'package:ez_core/ez_core.dart';
import 'package:wellness_hub_australia/app/app.logger.dart';
import 'package:wellness_hub_australia/app/shared/ui/setup_dialog_ui.dart';
import 'package:wellness_hub_australia/features/pillars/pillars_service.dart';
import 'package:wellness_hub_australia/features/task_alarm/pages/add_task_alarm_page.dart';
import 'package:wellness_hub_australia/features/tasks/pages/task_detail_page.dart';
import 'package:wellness_hub_australia/features/tasks/services/task_service.dart';
import 'package:stacked/stacked.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/app/models/pillar_progress.model.dart';
import 'package:wellness_hub_australia/app/models/task.model.dart';
import 'package:stacked_services/stacked_services.dart';

class TasksViewModel extends ReactiveViewModel {
  final log = getLogger('TasksViewModel');
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _taskService = locator<TaskService>();
  final _pillarService = locator<PillarService>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_taskService];

  @override
  void onFutureError(error, Object? key) {
    log.e(error);
    {
      _dialogService.showCustomDialog(
          variant: DialogType.error,
          barrierDismissible: true,
          description: error.toString());
    }
    super.onFutureError(error, key);
  }

  void goToTaskDetailPage(int? taskId) {
    _navigationService.navigateToView(TaskDetailPage(taskId: taskId));
  }

  void goToTaskAlarmPage(int? taskId) {
    _navigationService.navigateToView(AddTaskAlarmPage(taskId: taskId));
  }

  int? pillarId;
  PillarProgress? get pillar =>
      _pillarService.pillarsProgress.safeFirstWhere((e) => e.id == pillarId);

  int? taskId;
  Task? get task => _taskService.tasks.safeFirstWhere((e) => e.id == taskId);

  List<Task> get tasks =>
      _taskService.tasks.where((task) => task.pillarId == pillarId).toList();

  Future getAll() async {
    await runBusyFuture(_taskService.getAll(), throwException: true);
  }

  Future<void> toggleProgress(int? taskId) async {
    await runBusyFuture(_taskService.toggleProgress(taskId),
        throwException: true);
  }
}
