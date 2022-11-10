import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/app/app.logger.dart';
import 'package:wellness_hub_australia/app/app_service.dart';
import 'package:wellness_hub_australia/app/shared/ui/setup_bottomsheet_ui.dart';
import 'package:wellness_hub_australia/app/shared/ui/setup_dialog_ui.dart';
import 'package:wellness_hub_australia/app/shared/ui/setup_snackbar_ui.dart';
import 'package:wellness_hub_australia/features_core/local_storage_service/local_storage_service.dart';
import 'package:wellness_hub_australia/models/address.model.dart';
import 'package:wellness_hub_australia/models/user.model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:faker/faker.dart' as fkr;

const String busyUserProfileUpdateKey = "busy-user-profile-update-key";

class AppViewModel extends ReactiveViewModel {
  final log = getLogger('AppViewModel');
  final _dialogService = locator<DialogService>();
  final _themeService = locator<ThemeService>();
  final _appService = locator<AppService>();
  final _storageService = locator<LocalStorageService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _snackbarService = locator<SnackbarService>();

  @override
  void onFutureError(error, Object? key) {
    log.e(error);
    _dialogService.showCustomDialog(
        variant: DialogType.error,
        barrierDismissible: true,
        description: error.toString());
    super.onFutureError(error, key);
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [
        _appService,
      ];

  User? get user => _appService.user;
  bool get isOnboarded => _storageService.isOnboarded == true ? true : false;

  Future<void> init() async {
    await runBusyFuture(_appService.fetchUser(), throwException: true);
  }

  void setTheme(int index) {
    _themeService.selectThemeAtIndex(index);
  }

  void toggleDarkLightTheme() {
    _themeService.toggleDarkLightTheme();
  }

  Future signOut() async {
    await _appService.signOut();
  }

  Future onboard() async {
    await _appService.onboard();
  }

  /// **********************/
  final _loginFormKey = GlobalKey<FormBuilderState>();
  GlobalKey<FormBuilderState> get loginFormKey => _loginFormKey;

  final _registerFormKey = GlobalKey<FormBuilderState>();
  GlobalKey<FormBuilderState> get registerFormKey => _registerFormKey;

  final _userProfileFormKey = GlobalKey<FormBuilderState>();
  GlobalKey<FormBuilderState> get userProfileFormKey => _userProfileFormKey;

  final _userProfilePictureFormKey = GlobalKey<FormBuilderState>();
  GlobalKey<FormBuilderState> get userProfilePictureFormKey =>
      _userProfilePictureFormKey;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  List<Address> _placesInAustralia = [];
  List<Address> get placesInAustralia => _placesInAustralia;

  Future loadPlacesInAustralia() async {
    _placesInAustralia = await _storageService.placesInAustralia();
    notifyListeners();
  }

  Future login() async {
    if (_loginFormKey.currentState!.saveAndValidate()) {
      final formValue = _loginFormKey.currentState?.instantValue;

      await runBusyFuture(_appService.login(formValue!), throwException: true);

      if (_appService.user?.role == "registered") {
        _bottomSheetService.showCustomSheet(
            variant: BottomSheetType.codeVerification,
            takesInput: true,
            enableDrag: false,
            barrierDismissible: false,
            useRootNavigator: true);
      }
    }
  }

  Future register() async {
    if (_registerFormKey.currentState!.saveAndValidate()) {
      final formValue = _registerFormKey.currentState?.instantValue;
      Map<String, dynamic> rawFormData = Map.of(formValue!);

      rawFormData.addAll({
        "place_name": rawFormData["address2"].placeName,
        "state_name": rawFormData["address2"].stateName,
        "state_code": rawFormData["address2"].stateCode,
        "postcode": rawFormData["address2"].postcode,
        "latitude": rawFormData["address2"].latitude,
        "longitude": rawFormData["address2"].longitude,
        "accuracy": rawFormData["address2"].accuracy,
      });
      rawFormData.remove('address2');

      await runBusyFuture(_appService.register(rawFormData),
          throwException: true);

      if (_appService.user?.role == "registered") {
        _bottomSheetService.showCustomSheet(
            variant: BottomSheetType.codeVerification,
            takesInput: true,
            enableDrag: false,
            barrierDismissible: false,
            useRootNavigator: true);
      }
    }
  }

  Future verifyCode() async {
    if (_registerFormKey.currentState!.saveAndValidate()) {
      final formValue = _registerFormKey.currentState?.instantValue;

      await runBusyFuture(_appService.verifyCode(formValue!),
          throwException: true);
    }
  }

  Future updateProfile() async {
    if (_userProfileFormKey.currentState!.saveAndValidate()) {
      final formValue = _userProfileFormKey.currentState?.instantValue;
      Map<String, dynamic> rawFormData = Map.of(formValue!);
      rawFormData.addAll({
        "full_address": rawFormData["address1"],
        "place_name": rawFormData["address2"].placeName,
        "state_name": rawFormData["address2"].stateName,
        "state_code": rawFormData["address2"].stateCode,
        "postcode": rawFormData["address2"].postcode,
        "latitude": rawFormData["address2"].latitude,
        "longitude": rawFormData["address2"].longitude,
        "accuracy": rawFormData["address2"].accuracy,
      });
      rawFormData.remove('address1');
      rawFormData.remove('address2');

      await runBusyFuture(_appService.updateProfile(rawFormData),
          busyObject: busyUserProfileUpdateKey, throwException: true);

      _snackbarService.showCustomSnackBar(
          message: "Profile Update Successful",
          duration: const Duration(seconds: 2),
          variant: SnackbarType.successful);
    }
  }

  void generateUser() {
    _registerFormKey.currentState!.patchValue(
      {
        'email': fkr.faker.internet.email(),
        'first_name': fkr.faker.person.firstName(),
        'last_name': fkr.faker.person.lastName(),
        'code': fkr.faker.randomGenerator.element(
          ["*(&^ASdhjk"],
        ),
        'mobile_number': "+61 111-111-111",
        'password': "testing",
        "password_confirmation": "testing",
      },
    );
  }

  Future fetchUser() async {
    await runBusyFuture(_appService.fetchUser(), throwException: true);
  }
}