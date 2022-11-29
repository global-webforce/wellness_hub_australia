import 'dart:convert';

import 'package:wellness_hub_australia/app/api/api_service.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/features/service_providers/services/service_providers_service.dart';
import 'package:wellness_hub_australia/app/api/api_endpoints.dart';
import 'package:wellness_hub_australia/models/service_provider.model.dart';
import 'package:stacked/stacked.dart';

class ServiceProvidersServiceLaravel
    with ReactiveServiceMixin
    implements ServiceProvidersService {
  final _apiService = locator<ApiService>();

  ServiceProvidersServiceLaravel() {
    listenToReactiveValues([
      _serviceProviders,
    ]);
  }

  final ReactiveValue<List<ServiceProvider>> _serviceProviders =
      ReactiveValue<List<ServiceProvider>>([]);

  @override
  Future findOne(int? id) async {
    await _apiService.get(
      ApiEndpoints.instance.serviceProvider(),
      onSuccess: (res) {
        _serviceProviders.value = List<ServiceProvider>.from(
            jsonDecode(res.body)
                .map((model) => ServiceProvider.fromJson(model)));
      },
      onError: (_) {},
    );
  }

  @override
  Future getAll() async {
    await _apiService.get(
      ApiEndpoints.serviceProviders,
      onSuccess: (res) {
        _serviceProviders.value = List<ServiceProvider>.from(
            jsonDecode(res.body)
                .map((model) => ServiceProvider.fromJson(model)));
      },
      onError: (_) {},
    );
  }

  @override
  List<ServiceProvider> get serviceProviders => _serviceProviders.value;
}
