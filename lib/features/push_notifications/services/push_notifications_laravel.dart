import 'dart:async';
import 'dart:convert';
import 'package:wellness_hub_australia/app/api/api_service.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/features/push_notifications/services/push_notifications_service.dart';
import 'package:wellness_hub_australia/app/api/api_endpoints.dart';
import 'package:wellness_hub_australia/models/push_notification.model.dart';
import 'package:stacked/stacked.dart';

class PushNotificationsServiceLaravel
    with ReactiveServiceMixin
    implements PushNotificationsService {
  final _apiService = locator<ApiService>();

  PushNotificationsServiceLaravel() {
    listenToReactiveValues([
      _notifications,
    ]);
  }

  final ReactiveValue<List<PushNotification>> _notifications =
      ReactiveValue<List<PushNotification>>(<PushNotification>[]);

  @override
  Future<void> delete(int? id) async {
    final index = _notifications.value.indexWhere((e) => e.id == id);
    final temp = _notifications.value.firstWhere((e) => e.id == id);

    _notifications.value.removeWhere((e) => e.id == id);
    notifyListeners();

    await _apiService.delete(
      ApiEndpoints.instance.notificationDelete(id),
      onSuccess: (res) {},
      onError: (_) {
        _notifications.value.insert(index, temp);
        notifyListeners();
      },
    );
  }

  @override
  PushNotification? findOne(int? id) {
    return _notifications.value.firstWhere((element) => element.id == id);
  }

  @override
  Future<void> getAll() async {
    await _apiService.get(
      ApiEndpoints.instance.notifications(),
      onSuccess: (res) {
        _notifications.value = List<PushNotification>.from(jsonDecode(res.body)
            .map((model) => PushNotification.fromJson(model)));
      },
      onError: (_) {},
    );
  }

  @override
  List<PushNotification> get notifications => _notifications.value;
}
