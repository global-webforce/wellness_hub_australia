import 'dart:async';
import 'dart:convert';
import 'package:wellness_hub_australia/app/api/api_service.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/features/credentials/services/credentials_service.dart';
import 'package:wellness_hub_australia/app/api/api_endpoints.dart';
import 'package:wellness_hub_australia/app/core/local_storage/local_storage_service.dart';
import 'package:wellness_hub_australia/app/models/credential.model.dart';
import 'package:http_parser/http_parser.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

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
    await _apiService.postFile(
      ApiEndpoints.instance.addCredential(),
      requestBody: formData,
      files: [
        http.MultipartFile.fromBytes(
          'attachment',
          await formData['attachment']![0].readAsBytes(),
          filename: formData['attachment']![0].name,
          contentType: MediaType("image", "*"),
        ),
      ],
      onSuccess: (res) async {
        await getAll();
      },
      onError: (e) {},
    );
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
