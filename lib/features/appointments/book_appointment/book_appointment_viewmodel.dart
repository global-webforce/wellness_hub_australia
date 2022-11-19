import 'package:wellness_hub_australia/app/app.logger.dart';
import 'package:wellness_hub_australia/app/shared/ui/setup_dialog_ui.dart';
import 'package:wellness_hub_australia/features/appointments/appointments/services/appointments_service.dart';
import 'package:wellness_hub_australia/features/appointments/book_appointment/pages/booking_successful_page.dart';
import 'package:wellness_hub_australia/models/field.model.dart';
import 'package:wellness_hub_australia/models/pillar.model.dart';
import 'package:wellness_hub_australia/models/service_provider.model.dart';
import 'package:flutter/material.dart';

import 'package:wellness_hub_australia/features/fields/services/fields_service.dart';
import 'package:wellness_hub_australia/features/pillars/pillars_service.dart';
import 'package:wellness_hub_australia/features/service_providers/services/service_providers_service.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const String busyAppintmentBookingKey = 'busy-appointment-booking-key';

class BookAppointmentViewModel extends ReactiveViewModel {
  final log = getLogger('ClientHomePageViewModel');
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _clientAppointmentsService = locator<AppointmentsService>();
  final _fieldsService = locator<FieldsService>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [
        _clientAppointmentsService,
      ];
  final PageController controller = PageController(
    initialPage: 0,
    keepPage: true,
  );

  DateTime datePicked = DateTime.now();

  final _pillarsService = locator<PillarService>();
  final _serviceProviderService = locator<ServiceProvidersService>();

  int? _selectedPillarId;
  int? _selectedFieldId;
  int? _selectedServiceId;

  DateTime? _selectedDate;
  DateTime? _selectedTime;
  String _selectedPaymentType = "Cash";

  List<Pillar> get pillars => _pillarsService.pillars;

  List<Field> get fields {
    List<Field> temp = _fieldsService.fields;
    if (_selectedPillarId != null) {
      temp = temp.where((e) => e.pillarId == _selectedPillarId).toList();
    }
    return temp;
  }

  List<ServiceProvider> get serviceProviders {
    List<ServiceProvider> temp = _serviceProviderService.serviceProviders;

    if (_selectedFieldId != null) {
      temp = _serviceProviderService.serviceProviders
          .where((item) =>
              item.offeredServices.any((e) => e.fieldId == _selectedFieldId))
          .toList();
    }
    return temp;
  }

  bool isReadyForBooking() {
    if (_selectedServiceId != null &&
        _selectedDate != null &&
        _selectedTime != null) {
      return true;
    }
    return false;
  }

  int _page = 0;
  int get page => _page;

  set page(int value) {
    _page = value;
    notifyListeners();
  }

  bool onWillPop() {
    if (_page == controller.initialPage) {
      return true;
    } else {
      controller.previousPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.linear,
      );
      return false;
    }
  }

  bool canProceed() {
    if (_page == 0) {
      if (_selectedPillarId != null) {
        return true;
      }
    }
    if (_page == 1) {
      if (_selectedFieldId != null) {
        return true;
      }
    }
    if (_page == 2) {
      if (_selectedServiceProvider != null) {
        return true;
      }
    }

    if (_page == 3) {
      return true;
    }

    return false;
  }

  void next() {
    controller.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void back() {
    if (_page == 3) {
      _selectedServiceProvider = null;

      _selectedServiceId = null;
    }
    if (_page == 4) {
      _selectedDate = null;
    }
    controller.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    notifyListeners();
  }

  int? get selectedPillarId => _selectedPillarId;
  Pillar? get selectedPillar =>
      pillars.firstWhere((e) => e.id == selectedPillarId);

  set selectedPillarId(int? value) {
    _selectedPillarId = value;
    controller.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    notifyListeners();
  }

  get selectedFieldId => _selectedFieldId;
  Field? get selectedField => fields.firstWhere((e) => e.id == selectedFieldId);

  set selectedFieldId(value) {
    _selectedFieldId = value;
    controller.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    notifyListeners();
  }

  get selectedServiceId => _selectedServiceId;

  set selectedServiceId(value) {
    _selectedServiceId = value;
    notifyListeners();
  }

  DateTime? get selectedDate => _selectedDate;

  set selectedDate(value) {
    _selectedDate = value;
    _selectedTime = null;
    notifyListeners();
  }

  DateTime? get selectedTime => _selectedTime;

  set selectedTime(value) {
    _selectedTime = value;
    _selectedDate = value;

    notifyListeners();
  }

  get selectedPaymentType => _selectedPaymentType;

  set selectedPaymentType(value) {
    _selectedPaymentType = value;
    notifyListeners();
  }

  ServiceProvider? _selectedServiceProvider;
  ServiceProvider? get selectedServiceProvider => _selectedServiceProvider;

  set selectedServiceProviderId(value) {
    _selectedServiceProvider =
        serviceProviders.firstWhere((e) => e.id == value);

    _selectedServiceId = _selectedServiceProvider!.offeredServices
        .firstWhere((e) => e.fieldId == _selectedFieldId)
        .id;

    controller.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    notifyListeners();
  }

  Future init() async {
    await runBusyFuture(
        Future.wait([
          _pillarsService.getPillars(),
          _fieldsService.getAll(),
          _serviceProviderService.getAll(),
        ], eagerError: true),
        throwException: true);
  }

  Future create() async {
    await runBusyFuture(
        _clientAppointmentsService.create({
          "start_date": _selectedDate?.toIso8601String(),
          "end_date":
              _selectedDate?.add(const Duration(hours: 1)).toIso8601String(),
          "payment_type": _selectedPaymentType,
          "field_assignment_id": _selectedServiceId,
          "status": "Pending",
          "paid": 0,
        }),
        busyObject: busyAppintmentBookingKey,
        throwException: true);

    await _navigationService.clearTillFirstAndShowView(
      const BookingSuccessfulPage(),
    );
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

  Future findOneAsync() async {
    await _serviceProviderService
        .findOne(selectedServiceProvider?.id)
        .then((value) {
      _selectedServiceProvider = value;
    }).catchError((e) {});
    notifyListeners();
  }
}
