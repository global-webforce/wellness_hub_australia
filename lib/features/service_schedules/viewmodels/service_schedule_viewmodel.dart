import 'dart:async';

import 'package:wellness_hub_australia/app/app.logger.dart';
import 'package:wellness_hub_australia/app/shared/ui/setup_dialog_ui.dart';
import 'package:wellness_hub_australia/app/shared/ui/setup_snackbar_ui.dart';
import 'package:wellness_hub_australia/features/service_schedules/pages/add_service_schedule_page.dart';
import 'package:wellness_hub_australia/features/service_schedules/services/service_schedule_service.dart';
import 'package:stacked/stacked.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/models/service_schedule.model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:stacked_services/stacked_services.dart';

const String busyScheduleDelete = 'busy-schedule-delete';

class ServiceSchedulesViewModel extends ReactiveViewModel {
  final log = getLogger('ServiceSchedulesViewModel');
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _snackbarService = locator<SnackbarService>();
  final _serviceSchedulesService = locator<ServiceSchedulesService>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_serviceSchedulesService];

  final _serviceScheduleFormKey = GlobalKey<FormBuilderState>();
  GlobalKey<FormBuilderState> get serviceScheduleFormKey =>
      _serviceScheduleFormKey;

  List<ServiceSchedule> get serviceSchedules =>
      _serviceSchedulesService.serviceSchedules;

  void goToAddPage() {
    _navigationService.navigateToView(const AddServiceSchedulePage());
  }

  @override
  void onFutureError(error, Object? key) {
    log.e(error);
    _dialogService.showCustomDialog(
        variant: DialogType.error,
        barrierDismissible: true,
        description: error.toString());
    super.onFutureError(error, key);
  }

  Future getAll() async {
    await runBusyFuture(_serviceSchedulesService.getAll(),
        throwException: true);
  }

  Future<void> create() async {
    if (_serviceScheduleFormKey.currentState!.saveAndValidate()) {
      final formValue = _serviceScheduleFormKey.currentState?.instantValue;

      await runBusyFuture(_serviceSchedulesService.create(formValue!),
          throwException: true);

      _serviceScheduleFormKey.currentState!.reset();

      _snackbarService.showCustomSnackBar(
          message: "Credential added",
          duration: const Duration(seconds: 2),
          variant: SnackbarType.successful);
    }
  }

  Future delete(int? id) async {
    await runBusyFuture(_serviceSchedulesService.delete(id),
        busyObject: busyScheduleDelete, throwException: true);

    _snackbarService.showCustomSnackBar(
      message: "Schedule #$id deleted",
      duration: const Duration(seconds: 2),
      variant: SnackbarType.error,
    );
  }
}
