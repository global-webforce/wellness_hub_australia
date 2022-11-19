import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:wellness_hub_australia/app/api/api_service.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/features/credentials/services/credentials_service.dart';
import 'package:wellness_hub_australia/app/api/api_endpoints.dart';
import 'package:wellness_hub_australia/features_core/local_storage_service/local_storage_service.dart';
import 'package:wellness_hub_australia/models/credential.model.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:stacked/stacked.dart';

class CredentialsServiceLaravel
    with ReactiveServiceMixin
    implements CredentialsService {
  final _apiService = locator<ApiService>();

  final _localStorageService = locator<LocalStorageService>();

  CredentialsServiceLaravel() {
    listenToReactiveValues([
      _credentials,
    ]);
  }

  final ReactiveValue<List<Credential>> _credentials =
      ReactiveValue<List<Credential>>([]);

  @override
  Future create(Map<String, dynamic> formData) async {
    var dio = Dio();
    final String? token = _localStorageService.token;

    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["authorization"] = "Bearer $token";

    Map<String, dynamic> rawFormData = Map.of(formData);
    rawFormData.remove("attachment");
    var requestBody = FormData.fromMap(rawFormData);
    try {
      List<dynamic> rawImageList = formData["attachment"] ?? [];
      List<XFileImage> xFileImageList = [];
      List<List<int>> xFileImageAsByteList = [];

      if (rawImageList.isNotEmpty) {
        for (var i = 0; i < rawImageList.length; i++) {
          xFileImageList.add(XFileImage(file: rawImageList[i]));
          xFileImageAsByteList.add(await xFileImageList[i].file.readAsBytes());
        }
        requestBody.files.add(MapEntry(
          'attachment',
          MultipartFile.fromBytes(
            await xFileImageList[0].file.readAsBytes(),
            filename: xFileImageList[0].file.name,
            contentType: MediaType("image", "*"),
          ),
        ));
      }
    } catch (e) {
      return Future.error(e.toString());
    }
    await dio
        .post(ApiEndpoints.instance.addCredential(), data: requestBody)
        .then((res) async {
      if (res.statusCode! >= 200 && res.statusCode! <= 299) {
        await getAll();
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
      return Future.error(error);
    });
  }

  @override
  Future delete(int? id) async {
    await _apiService.delete(ApiEndpoints.instance.deleteCredential(id),
        onSuccess: (res) async {
      await getAll();
    }, onError: (_) {});
  }

  @override
  Future getAll() async {
    await _apiService.get(
      ApiEndpoints.instance.credentials(),
      onSuccess: (res) {
        _credentials.value = List<Credential>.from(
            jsonDecode(res.body).map((model) => Credential.fromJson(model)));
      },
      onError: (_) {},
    );
  }

  @override
  List<Credential> get credentials => _credentials.value;
}
