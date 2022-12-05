import 'package:wellness_hub_australia/app/models/task.model.dart';
import 'package:stacked/stacked.dart';

abstract class TaskService with ReactiveServiceMixin {
  List<Task> get tasks;

  Future<void> getAll();
  Future<dynamic> toggleProgress(int? taskID);
}
