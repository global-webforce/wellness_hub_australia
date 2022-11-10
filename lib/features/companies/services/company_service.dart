import 'package:wellness_hub_australia/models/company.model.dart';

abstract class CompanyService {
  List<Company> get companies;

  Future<void> getAll();
}
