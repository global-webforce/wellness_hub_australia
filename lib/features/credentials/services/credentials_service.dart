import 'package:wellness_hub_australia/models/credential.model.dart';
import 'package:stacked/stacked.dart';

abstract class CredentialsService with ReactiveServiceMixin {
  List<Credential> get credentials;
  Future getAll();
  Future create(Map<String, dynamic> formData);
  Future delete(int? id);
}
