import 'package:wellness_hub_australia/app/models/push_notification.model.dart';
import 'package:stacked/stacked.dart';

abstract class PushNotificationsService with ReactiveServiceMixin {
  List<PushNotification> get notifications;
  PushNotification? findOne(int? id);
  Future<void> getAll();
  Future<void> delete(int? id);
}
