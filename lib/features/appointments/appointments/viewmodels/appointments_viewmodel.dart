import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:wellness_hub_australia/app/app.logger.dart';
import 'package:wellness_hub_australia/app/app_service.dart';
import 'package:wellness_hub_australia/app/shared/ui/setup_dialog_ui.dart';
import 'package:wellness_hub_australia/app/shared/ui/setup_snackbar_ui.dart';
import 'package:wellness_hub_australia/features/appointments/appointments/pages/appointment_detail_page.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart' as calendar;
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/features/appointments/appointments/services/appointments_service.dart';
import 'package:wellness_hub_australia/models/appointment.model.dart';

class AppointmentViewModel extends ReactiveViewModel {
  final _appointmentFormKey = GlobalKey<FormBuilderState>();
  GlobalKey<FormBuilderState> get appointmentFormKey => _appointmentFormKey;

  @override
  void onFutureError(error, Object? key) {
    log.e(error);

    _dialogService.showCustomDialog(
        variant: DialogType.error,
        barrierDismissible: true,
        description: error.toString());
    super.onFutureError(error, key);
  }

  final log = getLogger('AppointmentViewModel');
  final _dialogService = locator<DialogService>();
  final navigationService = locator<NavigationService>();
  final _appointmentService = locator<AppointmentsService>();
  final _snackbarService = locator<SnackbarService>();
  final _appService = locator<AppService>();

  bool _editMode = false;
  bool get editMode => _editMode;
  set editMode(bool value) {
    _editMode = value;
    notifyListeners();
  }

  bool get bookingEnabled => _appService.user?.role == "member" ? true : false;

  @override
  List<ReactiveServiceMixin> get reactiveServices => [
        _appointmentService,
      ];

  void end() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
  }

  final calendar.CalendarController controller1 = calendar.CalendarController();
  final calendar.CalendarController controller2 = calendar.CalendarController();
  final calendar.CalendarController controller3 = calendar.CalendarController();
  final calendar.CalendarController controller4 = calendar.CalendarController();
  final calendar.CalendarController controller5 = calendar.CalendarController();

  DateTime datePicked = DateTime.now();

  List<Appointment> get clientAppointments => _appointmentService.appointments;

  List<Appointment> get clientAppointmentsUpcoming =>
      _appointmentService.appointments
          .where((e) =>
              e.status == "Confirmed" &&
              e.startDate?.isAfter(DateTime.now()) == true)
          .toList();

  List<Appointment> get clientAppointmentsCompleted =>
      _appointmentService.appointments
          .where((e) =>
              e.status == "Completed" &&
              e.startDate?.isAfter(DateTime.now()) == true)
          .toList();

  List<Appointment> get clientAppointmentsMissed => _appointmentService
      .appointments
      .where((e) =>
          e.status == "Missed" && e.endDate!.isAfter(DateTime.now()) == true)
      .toList();

  List<Appointment> get clientAppointmentsCancelled =>
      _appointmentService.appointments
          .where((e) => e.status == "Cancelled")
          .toList();

  Future update() async {
    if (_appointmentFormKey.currentState!.saveAndValidate()) {
      final formValue = _appointmentFormKey.currentState?.instantValue;
      Map<String, dynamic> rawFormData = Map.of(formValue!);

      await runBusyFuture(
          _appointmentService.update(_selectedAppointmentId, rawFormData),
          throwException: true);

      _snackbarService.showCustomSnackBar(
          message: "Appoinment Updated",
          duration: const Duration(seconds: 2),
          variant: SnackbarType.successful);
    }
  }

  Future getAll() async {
    setBusy(true);

    await _appointmentService.getAll().catchError((e) {
      log.e(e);

      _dialogService.showCustomDialog(
          variant: DialogType.error,
          barrierDismissible: true,
          description: e.toString());
    });

    setBusy(false);
  }

  int? _selectedAppointmentId;
  set selectedAppointmentId(int? value) => _selectedAppointmentId = value;

  Appointment? get getSelectedAppointment => _appointmentService.appointments
      .firstWhere((e) => e.id == _selectedAppointmentId);

  void viewChanged(calendar.ViewChangedDetails viewChangedDetails) {
    SchedulerBinding.instance.addPostFrameCallback((duration) {
      datePicked = viewChangedDetails
          .visibleDates[viewChangedDetails.visibleDates.length ~/ 2];
    });
  }

  void calendarTapped(calendar.CalendarTapDetails details) {
    if (details.targetElement == calendar.CalendarElement.appointment ||
        details.targetElement == calendar.CalendarElement.agenda) {
      navigationService.navigateToView(
        AppointmentDetailPage(appointmentId: details.appointments![0].id),
        fullscreenDialog: true,
        transitionStyle: Transition.fade,
      );
    }
  }
}
