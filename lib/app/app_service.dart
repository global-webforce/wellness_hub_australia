import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:wellness_hub_australia/app/api/api_service.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/features_core/local_storage_service/local_storage_service.dart';
import 'package:wellness_hub_australia/models/user.model.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:http_parser/http_parser.dart' as http_parser;
import 'package:wellness_hub_australia/app/api/api_endpoints.dart';
import 'package:stacked/stacked.dart';

class AppService with ReactiveServiceMixin {
  final _apiService = locator<ApiService>();
  final _localStorageService = locator<LocalStorageService>();

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
    //final token = _localStorageService.token;
    /*   if (token != null) {
      await _apiService.post(
        "${ApiEndpoints.baseUrl}/user/${_localStorageService.user!.id}",
        onSuccess: (res) {
          _user.value = User.fromJson(jsonDecode(res.body));
          _localStorageService.user = _user.value;
          _localStorageService.token = jsonDecode(res.body)["token"];
        },
        onError: (e) {
          return Future.error(e.toString());
        },
      );
    } */
  }

  Future updateProfile(Map<String, dynamic> formData) async {
    var dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["authorization"] =
        'Bearer ${_localStorageService.token}';
    Map<String, dynamic> rawFormData = Map.of(formData);
    rawFormData.remove("profile_pic");
    var requestBody = FormData.fromMap(rawFormData);
    try {
      List<dynamic> rawImageList = formData["profile_pic"] ?? [];
      List<XFileImage> xFileImageList = [];
      List<List<int>> xFileImageAsByteList = [];

      if (rawImageList.isNotEmpty) {
        for (var i = 0; i < rawImageList.length; i++) {
          xFileImageList.add(XFileImage(file: rawImageList[i]));
          xFileImageAsByteList.add(await xFileImageList[i].file.readAsBytes());
        }

        requestBody.files.add(MapEntry(
          'profile-pic',
          MultipartFile.fromBytes(await xFileImageList[0].file.readAsBytes(),
              filename: xFileImageList[0].file.name,
              contentType: http_parser.MediaType("image", "*"),
              headers: {}),
        ));
      }
    } catch (e) {
      return Future.error(e.toString());
    }

    await dio
        .post(ApiEndpoints.instance.userProfile(), data: requestBody)
        .then((res) async {
      if (res.statusCode! >= 200 && res.statusCode! <= 299) {
        _user.value = User.fromJson(res.data);
        _localStorageService.user = User.fromJson(res.data);
      } else {
        return Future.error(res.data.toString());
      }
    }).catchError((e) {
      final String error = "$e";

      if (error.isEmpty) {
        return Future.error("Unknown error");
      }

      if (error.contains("XMLHttpRequest error")) {
        return Future.error("Network request failed");
      }
      if (error.contains("Invalid Credentials")) {
        return Future.error("Invalid Credentials");
      }
      if (error.contains("Failed host lookup")) {
        return Future.error("Check your internet connection");
      }
      return Future.error(error);
    });
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
