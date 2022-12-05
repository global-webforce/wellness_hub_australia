import 'package:wellness_hub_australia/app/models/service_schedule.model.dart';
import 'package:stacked/stacked.dart';

abstract class ServiceSchedulesService with ReactiveServiceMixin {
  List<ServiceSchedule> get serviceSchedules;
  Future getAll();
  Future create(Map<String, dynamic> formData);
  Future update(Map<String, dynamic> formData);
  Future delete(int? id);
}
