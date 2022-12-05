import 'dart:async';
import 'dart:convert';
import 'package:http_parser/http_parser.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wellness_hub_australia/app/api/api_service.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/app/core/local_storage/local_storage_service.dart';
import 'package:wellness_hub_australia/app/models/user.model.dart';
import 'package:wellness_hub_australia/app/api/api_endpoints.dart';
import 'package:stacked/stacked.dart';

import 'package:http/http.dart' as http;

class AppService with ReactiveServiceMixin {
  final _dialogService = locator<DialogService>();
  final _apiService = locator<ApiService>();
  final _localStorageService = locator<LocalStorageService>();
  DialogService get dialogService => _dialogService;

  AppService() {
    listenToReactiveValues([
      _user,
      _isOnboarded,
    ]);
  }

  final ReactiveValue<User?> _user = ReactiveValue<User?>(null);
  final ReactiveValue<bool?> _isOnboarded = ReactiveValue<bool?>(null);

  User? get user => _user.value;
  set user(User? user) {
    _user.value = user;
  }

  bool? get isOnboarded => _isOnboarded.value;

  Future login(Map<String, dynamic> formData) async {
    await _apiService.post(
      ApiEndpoints.login,
      requestBody: formData,
      onSuccess: (res) {
        _user.value = User.fromJson(jsonDecode(res.body)["user"]);
        _localStorageService.user = User.fromJson(jsonDecode(res.body)["user"]);
        _localStorageService.token = jsonDecode(res.body)["token"];
      },
      onError: (e) {},
    );
  }

  Future register(Map<String, dynamic> formData) async {
    await _apiService.post(
      ApiEndpoints.register,
      requestBody: formData,
      onSuccess: (res) {
        _user.value = User.fromJson(jsonDecode(res.body)["user"]);
        _localStorageService.user = User.fromJson(jsonDecode(res.body)["user"]);
        _localStorageService.token = jsonDecode(res.body)["token"];
      },
      onError: (e) {},
    );
  }

  Future verifyCode(Map<String, dynamic> formData) async {
    await _apiService.post(
      ApiEndpoints.instance.verifyUserByCode(),
      requestBody: formData,
      onSuccess: (res) {
        _user.value = User.fromJson(jsonDecode(res.body));
        _localStorageService.user = _user.value;
      },
      onError: (e) {},
    );
  }

  Future fetchUser({int? userId}) async {
    _user.value = _localStorageService.user;
  }

  Future xxx(Map<String, dynamic> formData) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse(ApiEndpoints.instance.userProfile()));
    formData.remove('profile_pic');
    request.fields
        .addEntries(formData.entries as Iterable<MapEntry<String, String>>);
    request.files.add(http.MultipartFile.fromBytes(
        'picture', formData['profile_pic']![0].readAsBytesSync(),
        filename: formData['profile_pic']![0].name));

    await request.send();
  }

  Future updateProfile(Map<String, dynamic> formData) async {
    await _apiService.postFile(
      ApiEndpoints.instance.userProfile(),
      requestBody: formData,
      files: [
        http.MultipartFile.fromBytes(
          'profile-pic',
          await formData['profile_pic']![0].readAsBytes(),
          filename: formData['profile_pic']![0].name,
          contentType: MediaType("image", "*"),
        ),
      ],
      onSuccess: (res) {
        _user.value = User.fromJson(jsonDecode(res.body));
        _localStorageService.user = _user.value;
      },
      onError: (e) {},
    );
  }

  Future<void> signOut() async {
    _user.value = null;
    _localStorageService.deleteUser();
  }

  Future<void> onboard() async {
    _isOnboarded.value = true;
    _localStorageService.isOnboarded = true;
  }
}
