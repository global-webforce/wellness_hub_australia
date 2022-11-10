import 'dart:async';
import 'package:wellness_hub_australia/app/api/api_service.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/features/company_members/services/company_members_service.dart';
import 'package:wellness_hub_australia/app/api/api_endpoints.dart';
import 'package:wellness_hub_australia/models/client.model.dart';
import 'package:wellness_hub_australia/models_faker/models_faker.dart';

class CompanyMembersServiceLaravel implements CompanyMembersService {
  final _apiService = locator<ApiService>();
  List<Client> _companyMembers = [];

  @override
  Future getAll(int? id) async {
    await _apiService.get(
      ApiEndpoints.companyMembers,
      onSuccess: (res) {
        _companyMembers = fakeCompanyMembers();
      },
      onError: (_) {},
    );
  }

  @override
  List<Client> get companyMembers => _companyMembers;
}
