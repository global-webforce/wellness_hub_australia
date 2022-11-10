import 'package:wellness_hub_australia/models/offered_service.model.dart';
import 'package:stacked/stacked.dart';

abstract class OfferedServicesService with ReactiveServiceMixin {
  List<OfferedService> get serviceProviderOfferedServices;
  Future getAll();
  Future create(Map<String, dynamic> formData);
  Future delete(int? id);
}
