import 'package:ez_core/ez_core.dart';
import 'package:wellness_hub_australia/app/app.logger.dart';
import 'package:wellness_hub_australia/app/shared/ui/setup_dialog_ui.dart';
import 'package:wellness_hub_australia/features/push_notifications/pages/push_notification_detail_page.dart';
import 'package:wellness_hub_australia/features/push_notifications/services/push_notifications_service.dart';
import 'package:stacked/stacked.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/models/push_notification.model.dart';
import 'package:stacked_services/stacked_services.dart';

class PushNotificationsViewModel extends ReactiveViewModel {
  final log = getLogger('PushNotificationsViewModel');
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  final _notificationService = locator<PushNotificationsService>();
  final _snackbarService = locator<SnackbarService>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_notificationService];

  List<PushNotification> get pushNotifications =>
      _notificationService.notifications;

  int? selectedNotificationId;
  PushNotification? get selectedNotification =>
      _notificationService.notifications
          .safeFirstWhere((e) => e.id == selectedNotificationId);

  void goToNotifDetail(int? id) {
    selectedNotificationId = id;
    _navigationService.navigateToView(PushNotificationDetailPage(id: id),
        transitionStyle: Transition.rightToLeftWithFade);
    notifyListeners();
  }

  @override
  void onFutureError(error, Object? key) {
    log.e(error);
    _dialogService.showCustomDialog(
        variant: DialogType.error,
        barrierDismissible: true,
        description: error.toString());
    super.onFutureError(error, key);
  }

  Future<void> getAll() async {
    await runBusyFuture(_notificationService.getAll(), throwException: true);
  }

  Future<void> delete(int? id) async {
    _navigationService.popRepeated(
      1,
    );
    await Future.delayed(const Duration(seconds: 1));
    await runBusyFuture(_notificationService.delete(id), throwException: true);
  }
}
