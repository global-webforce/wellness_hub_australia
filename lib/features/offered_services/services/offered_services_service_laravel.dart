import 'dart:async';
import 'dart:convert';

import 'package:wellness_hub_australia/app/api/api_service.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/features/offered_services/services/offered_services_service.dart';
import 'package:wellness_hub_australia/app/api/api_endpoints.dart';
import 'package:wellness_hub_australia/models/offered_service.model.dart';
import 'package:stacked/stacked.dart';

class OfferedServicesServiceLaravel
    with ReactiveServiceMixin
    implements OfferedServicesService {
  final _apiService = locator<ApiService>();

  OfferedServicesServiceLaravel() {
    listenToReactiveValues([
      _serviceProviderOfferedServices,
    ]);
  }

  final ReactiveValue<List<OfferedService>> _serviceProviderOfferedServices =
      ReactiveValue<List<OfferedService>>([]);

  @override
  Future create(Map<String, dynamic> formData) async {
    await _apiService.post(
      ApiEndpoints.instance.addService(),
      requestBody: formData,
      onSuccess: (res) async {
        await getAll();
      },
      onError: (_) {},
    );
  }

  @override
  Future delete(int? id) async {
    await _apiService.delete(
      ApiEndpoints.instance.deleteService(id),
      onSuccess: (res) async {
        await getAll();
      },
      onError: (_) {},
    );
  }

  @override
  Future getAll() async {
    await _apiService.get(
      ApiEndpoints.instance.services(),
      onSuccess: (res) async {
        _serviceProviderOfferedServices.value = List<OfferedService>.from(
            jsonDecode(res.body)
                .map((model) => OfferedService.fromJson(model)));
      },
      onError: (_) {},
    );
  }

  @override
  List<OfferedService> get serviceProviderOfferedServices =>
      _serviceProviderOfferedServices.value;
}
