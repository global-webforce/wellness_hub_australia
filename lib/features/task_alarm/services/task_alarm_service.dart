abstract class TaskAlarmService {
  Future<void> create(Map<String, dynamic> formValue);
  Future<void> update(Map<String, dynamic> formValue);
  Future<void> delete(int? id);
}
