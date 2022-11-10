import 'dart:async';
import 'dart:convert';
import 'package:wellness_hub_australia/app/api/api_service.dart';
import 'package:wellness_hub_australia/features/fields/services/fields_service.dart';
import 'package:wellness_hub_australia/app/api/api_endpoints.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/models/field.model.dart';

class FieldsServiceLaravel implements FieldsService {
  final _apiService = locator<ApiService>();

  List<Field> _fields = [];

  @override
  Future getAll() async {
    await _apiService.get(
      ApiEndpoints.fields,
      onSuccess: (res) {
        _fields = List<Field>.from(
            jsonDecode(res.body).map((model) => Field.fromJson(model)));
      },
      onError: (_) {},
    );
  }

  @override
  List<Field> get fields => _fields;
}
