import 'dart:async';
import 'package:wellness_hub_australia/app/api/api_endpoints.dart';
import 'package:wellness_hub_australia/app/api/api_service.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/models/company.model.dart';
import 'package:wellness_hub_australia/models_faker/models_faker.dart';
import 'company_service.dart';

class CompanyServiceLaravel implements CompanyService {
  final _apiService = locator<ApiService>();

  List<Company> _companies = [];

  @override
  Future getAll() async {
    await _apiService.get(
      ApiEndpoints.instance.companies(),
      onSuccess: (res) {
        _companies = fakeCompanies();
      },
      onError: (_) {},
    );
  }

  @override
  List<Company> get companies => _companies;
}
