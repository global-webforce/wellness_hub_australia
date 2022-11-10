import 'package:wellness_hub_australia/models/client.model.dart';

abstract class CompanyMembersService {
  List<Client> get companyMembers;
  Future<void> getAll(int? id);
}
