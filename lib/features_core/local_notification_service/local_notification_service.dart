import 'package:wellness_hub_australia/models/task.model.dart';
import 'package:flutter/cupertino.dart';

abstract class LocalNotificationService with ChangeNotifier {
  Stream<int> get dataStream;
  List<dynamic> get scheduledNotifications;
  List<dynamic> get scheduledNotificationsGrouped;
  void initialize();
  void askPermission(BuildContext context);
  void listen();
  void end();
  Future getAll();

  dynamic findOne(int id);
  Future<void> remove(id);
  Future<void> removeAll();

  Future<void> createTaskNotification(Task? task);
}
