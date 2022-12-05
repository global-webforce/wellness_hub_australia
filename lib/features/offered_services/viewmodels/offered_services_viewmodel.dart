import 'dart:async';

import 'package:wellness_hub_australia/app/app.viewmodels_busy_keys.dart';
import 'package:wellness_hub_australia/app/app.logger.dart';
import 'package:wellness_hub_australia/app/shared/ui/setup_snackbar_ui.dart';
import 'package:wellness_hub_australia/features/fields/services/fields_service.dart';
import 'package:wellness_hub_australia/features/offered_services/pages/add_offered_services_page.dart';
import 'package:wellness_hub_australia/features/offered_services/services/offered_services_service.dart';
import 'package:wellness_hub_australia/app/models/field.model.dart';
import 'package:stacked/stacked.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/app/models/offered_service.model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:stacked_services/stacked_services.dart';

class OfferedServicesViewModel extends ReactiveViewModel {
  final log = getLogger('CredentialsViewModel');
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _offeredServicesService = locator<OfferedServicesService>();
  final _fieldsService = locator<FieldsService>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_offeredServicesService];

  void goToAddPage() {
    _navigationService.navigateToView(const AddOfferedServicePage());
  }

  final _offeredServicesFormKey = GlobalKey<FormBuilderState>();
  GlobalKey<FormBuilderState> get offeredServicesFormKey =>
      _offeredServicesFormKey;

  List<OfferedService> get offeredServices =>
      _offeredServicesService.serviceProviderOfferedServices;

  List<Field> get fields => _fieldsService.fields;

  Future getAll() async {
    await runBusyFuture(_offeredServicesService.getAll(), throwException: true);
  }

  Future getFields() async {
    await runBusyFuture(_fieldsService.getAll(),
        busyObject: 'getFields', throwException: true);
  }

  Future<void> create() async {
    if (offeredServicesFormKey.currentState!.saveAndValidate()) {
      final formValue = _offeredServicesFormKey.currentState?.instantValue;
      await runBusyFuture(_offeredServicesService.create(formValue!),
          throwException: true);

      _offeredServicesFormKey.currentState!.reset();

      _snackbarService.showCustomSnackBar(
        message: "Offered service added",
        duration: const Duration(seconds: 2),
        variant: SnackbarType.successful,
      );
    }
  }

  Future delete(int? id) async {
    await runBusyFuture(
      _offeredServicesService.delete(id),
      busyObject: ViewModelBusyKeys.offeredServiceDelete,
      throwException: true,
    );

    _snackbarService.showCustomSnackBar(
      message: "Offered service #$id deleted",
      duration: const Duration(seconds: 2),
      variant: SnackbarType.error,
    );
  }
}
