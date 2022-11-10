import 'package:ez_core/ez_core.dart';
import 'package:wellness_hub_australia/app/app.logger.dart';
import 'package:wellness_hub_australia/app/shared/ui/setup_dialog_ui.dart';
import 'package:wellness_hub_australia/features/fields/services/fields_service.dart';
import 'package:wellness_hub_australia/features/service_providers/services/service_providers_service.dart';
import 'package:stacked/stacked.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/models/field.model.dart';
import 'package:wellness_hub_australia/models/service_provider.model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:stacked_services/stacked_services.dart';

class ServiceProvidersViewModel extends ReactiveViewModel {
  final log = getLogger('ServiceProvidersViewModel');
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  final _serviceProviderService = locator<ServiceProvidersService>();
  final _fieldsService = locator<FieldsService>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_serviceProviderService];

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
    await runBusyFuture(_serviceProviderService.getAll(), throwException: true);
  }

  final _credentialFormKey = GlobalKey<FormBuilderState>();
  GlobalKey<FormBuilderState> get credentialFormKey => _credentialFormKey;

  ServiceProvider? _serviceProvider;
  ServiceProvider? get serviceProvider => _serviceProvider;

  int? filterFieldId;
  Field? get selectedField =>
      _fieldsService.fields.safeFirstWhere((e) => e.id == filterFieldId);

  List<ServiceProvider> get serviceProviders {
    List<ServiceProvider> temp = _serviceProviderService.serviceProviders;

    if (filterFieldId != null) {
      temp = _serviceProviderService.serviceProviders
          .where((item) =>
              item.offeredServices.any((e) => e.fieldId == filterFieldId))
          .toList();
    }

    return temp;
  }

  Future findOneAsync(int? id) async {
    setBusy(true);
    await _serviceProviderService.findOne(id).then((value) {
      _serviceProvider = value;
    }).catchError((e) {});

    setBusy(false);
  }

  findOne(int? id) {
    _serviceProvider = _serviceProviderService.serviceProviders
        .safeFirstWhere((e) => e.id == id);
  }
}
