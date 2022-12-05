import 'package:wellness_hub_australia/app/models/service_provider.model.dart';
import 'package:stacked/stacked.dart';

abstract class ServiceProvidersService with ReactiveServiceMixin {
  List<ServiceProvider> get serviceProviders;
  Future findOne(int? id);
  Future getAll();
}
