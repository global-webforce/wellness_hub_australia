import 'package:ez_core/ez_core.dart';
import 'package:wellness_hub_australia/app/app.viewmodels_busy_keys.dart';
import 'package:wellness_hub_australia/app/app.logger.dart';
import 'package:wellness_hub_australia/app/shared/ui/setup_dialog_ui.dart';
import 'package:wellness_hub_australia/app/shared/ui/setup_snackbar_ui.dart';
import 'package:wellness_hub_australia/features/task_alarm/services/task_alarm_service.dart';
import 'package:wellness_hub_australia/features/tasks/services/task_service.dart';
import 'package:stacked/stacked.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/app/models/task.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:stacked_services/stacked_services.dart';

class TaskAlarmViewModel extends ReactiveViewModel {
  final log = getLogger('TaskAlarmViewModel');

  final _dialogService = locator<DialogService>();
  final _taskService = locator<TaskService>();
  final _taskAlarmService = locator<TaskAlarmService>();
  final _snackbarService = locator<SnackbarService>();

  final _alarmFormKey = GlobalKey<FormBuilderState>();
  GlobalKey<FormBuilderState> get alarmFormKey => _alarmFormKey;

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

  @override
  List<ReactiveServiceMixin> get reactiveServices => [
        _taskService,
      ];

  int? taskId;
  Task? get task => _taskService.tasks.safeFirstWhere((e) => e.id == taskId);

  Future<void> delete(int? id) async {
    await runBusyFuture(
        _taskAlarmService.delete(id).then((_) {
          _alarmFormKey.currentState!.patchValue({
            'weekdays': [DateTime.now().weekdayName()],
            "timeSlots": DateTime.now(),
            "enabled": true,
          });
        }),
        busyObject: ViewModelBusyKeys.taskAlarmDelete,
        throwException: true);

    _snackbarService.showCustomSnackBar(
      message: "Alarm deleted",
      duration: const Duration(seconds: 2),
      variant: SnackbarType.error,
    );
  }

  Future<void> create() async {
    if (_alarmFormKey.currentState!.saveAndValidate()) {
      final formValue = _alarmFormKey.currentState?.instantValue;
      Map<String, dynamic> rawFormData = Map.of(formValue!);
      rawFormData.addAll({
        'task_id': task!.id,
      });
      await runBusyFuture(_taskAlarmService.create(rawFormData),
          throwException: true);

      _snackbarService.showCustomSnackBar(
          message: "Alarm set",
          duration: const Duration(seconds: 2),
          variant: SnackbarType.successful);
    }
  }

  Future<void> update() async {
    if (_alarmFormKey.currentState!.saveAndValidate()) {
      final formValue = _alarmFormKey.currentState?.instantValue;
      Map<String, dynamic> rawFormData = Map.of(formValue!);
      rawFormData.addAll({
        'id': task!.schedule!.id,
        'task_id': task!.id,
      });
      await runBusyFuture(_taskAlarmService.update(rawFormData),
          busyObject: ViewModelBusyKeys.taskAlarmUpdate, throwException: true);

      _snackbarService.showCustomSnackBar(
          message: "Alarm updated",
          duration: const Duration(seconds: 2),
          variant: SnackbarType.successful);
    }
  }
}
