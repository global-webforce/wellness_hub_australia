import 'dart:async';

import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/app/app.logger.dart';
import 'package:wellness_hub_australia/app/shared/ui/setup_dialog_ui.dart';
import 'package:wellness_hub_australia/app/shared/ui/setup_snackbar_ui.dart';
import 'package:wellness_hub_australia/features/credentials/pages/add_credential_page.dart';
import 'package:wellness_hub_australia/features/credentials/services/credentials_service.dart';
import 'package:stacked/stacked.dart';
import 'package:wellness_hub_australia/models/credential.model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:stacked_services/stacked_services.dart';

const String busyCredentialDelete = 'busy-credential-delete';

class CredentialsViewModel extends ReactiveViewModel {
  final log = getLogger('CredentialsViewModel');
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _snackbarService = locator<SnackbarService>();
  final _credentialsService = locator<CredentialsService>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_credentialsService];

  final _credentialFormKey = GlobalKey<FormBuilderState>();
  GlobalKey<FormBuilderState> get credentialFormKey => _credentialFormKey;

  List<Credential> get credentials => _credentialsService.credentials;

  void goToAddPage() {
    _navigationService.navigateToView(const AddCredentialPage());
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
    await runBusyFuture(_credentialsService.getAll(), throwException: true);
  }

  Future create() async {
    if (_credentialFormKey.currentState!.saveAndValidate()) {
      final formValue = _credentialFormKey.currentState?.instantValue;

      await runBusyFuture(_credentialsService.create(formValue!),
          throwException: true);

      _credentialFormKey.currentState!.reset();

      _snackbarService.showCustomSnackBar(
          message: "Credential added",
          duration: const Duration(seconds: 2),
          variant: SnackbarType.successful);
    }
  }

  Future delete(int? id) async {
    await runBusyFuture(_credentialsService.delete(id),
        busyObject: busyCredentialDelete, throwException: true);

    _snackbarService.showCustomSnackBar(
      message: "Credential #$id deleted",
      duration: const Duration(seconds: 2),
      variant: SnackbarType.error,
    );
  }
}
