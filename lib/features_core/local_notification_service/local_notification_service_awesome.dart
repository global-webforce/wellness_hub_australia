// ignore_for_file: unused_local_variable

import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:ez_core/ez_core.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:wellness_hub_australia/app/app_service.dart';
import 'package:wellness_hub_australia/features_core/local_notification_service/local_notification_service.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/models/task.model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

/*
https://stackoverflow.com/a/61360469/10494346
*/

class LocalNotificationServiceAwesome extends ChangeNotifier
    implements LocalNotificationService {
  final _appService = locator<AppService>();

  final _awesomeNotifications = AwesomeNotifications();

  final StreamController<int> _dataStreamController =
      StreamController<int>.broadcast();

  final bool isNotWeb = (defaultTargetPlatform == TargetPlatform.android) ||
      (defaultTargetPlatform == TargetPlatform.iOS);

  @override
  Stream<int> get dataStream => _dataStreamController.stream;

  List<NotificationModel> _scheduledNotifications = [];
  @override
  List<NotificationModel> get scheduledNotifications => _scheduledNotifications;

  final List<String> _scheduledNotificationsGrouped = [];
  @override
  List<String> get scheduledNotificationsGrouped =>
      _scheduledNotificationsGrouped;

  @override
  Future<void> getAll() async {
    if (isNotWeb) {
      await AwesomeNotifications().listScheduledNotifications().then((value) {
        _scheduledNotifications = value;
        final groupBygroupKey =
            _scheduledNotifications.groupBy((m) => m.content?.groupKey);

        debugPrint("$groupBygroupKey");
        _dataStreamController.sink.add(0);
      });
    }
  }

  @override
  void initialize() {
    if (isNotWeb) {
      final currentUserID = _appService.user?.id;

      StreamSubscription<ReceivedNotification>?
          notificationsCreatedStreamSubscription;

      _awesomeNotifications.initialize(
        'resource://drawable/res_notification_app_icon',
        [
          NotificationChannel(
            channelKey: '$currentUserID|basic_channel',
            channelName: 'Basic Notifications',
            channelDescription: '',
            defaultColor: Colors.teal,
            importance: NotificationImportance.High,
            channelShowBadge: true,
          ),
          NotificationChannel(
            channelKey: '$currentUserID|task_reminder_channel',
            channelName: 'Task Reminder Notifications',
            channelDescription: '',
            defaultColor: Colors.red,
            importance: NotificationImportance.High,
            channelShowBadge: true,
            //soundSource: 'resource://raw/res_custom_notification',
          ),
        ],
      );
    }
  }

  @override
  void end() {
    final currentUserID = _appService.user?.id;
  }

  @override
  void askPermission(BuildContext context) {
    if (isNotWeb) {
      _awesomeNotifications.isNotificationAllowed().then((isAllowed) {
        if (!isAllowed) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const EzText.body("Allow Notifications"),
              content: const EzText.body(
                  "Our app would like to send you notifications"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const EzText.body("Don't allow")),
                TextButton(
                    onPressed: () => _awesomeNotifications
                        .requestPermissionToSendNotifications()
                        .then((_) => Navigator.pop(context)),
                    child: const EzText.body("Allow"))
              ],
            ),
          );
        }
      });
    }
  }

  @override
  Future<void> createTaskNotification(Task? task) async {
    final currentUserID = _appService.user?.id;

/*       final actionButtons = [
        NotificationActionButton(
          key: 'SET_AS_FINISHED',
          label: 'Set as Finished',
          autoDismissible: false,
        ),
      ];

      for (var day in scheduler.weekdayList) {
        for (var time in scheduler.timeList) {
          _awesomeNotifications.createNotification(
            content: NotificationContent(
              id: createUniqueId(),
              groupKey: "$currentUserID|$taskID",
              channelKey: '$currentUserID|task_reminder_channel',
              title: "headline6",
              body: "description",
              summary: "description",
              payload: {
                'taskID': '$taskID',
                'notificationID': '$createUniqueId()'
              },
              category: NotificationCategory.Reminder,
              // largeIcon: "icon",
              roundedLargeIcon: true,
              notificationLayout: NotificationLayout.BigText,
              wakeUpScreen: true,
              displayOnForeground: true,
              displayOnBackground: true,
            ),
            actionButtons: actionButtons,
            schedule: NotificationCalendar(
              timeZone: localTimeZone,
              weekday: day,
              hour: time.hour,
              minute: time.minute,
              second: 0,
              millisecond: 0,
              repeats: scheduler.repeat,
            ),
          );
        }
      }
      _scheduledNotificationsGrouped
          .add("#$currentUserID|$taskID ${schedule.getSummary()}");
      _dataStreamController.sink.add(0); */
  }

  @override
  void listen() {
    if (isNotWeb) {
      final currentUserID = _appService.user?.id;
      Logger logger = Logger();
      try {} catch (e) {
        logger.e(e);
      }
    }
  }

  @override
  NotificationModel? findOne(int id) {
    if (isNotWeb) {
      return _scheduledNotifications.firstWhere((e) => e.content?.id == id);
    }
    return null;
  }

  @override
  Future<void> remove(id) async {
    /*  if (isNotWeb) {
      await _awesomeNotifications.cancel(id).then((value) async {
        _scheduledNotifications.removeWhere((e) => e.content!.id == id);
        _dataStreamController.sink.add(0);
      });
    } */
  }

  @override
  Future<void> removeAll() async {
    if (isNotWeb) {
      await _awesomeNotifications.cancelAllSchedules().then((_) async {
        _scheduledNotifications.clear();
        _scheduledNotificationsGrouped.clear();
        _dataStreamController.sink.add(0);
      });
    }
  }

/*  @override
  Future<void> createPlantFoodNotification() async {
    await _awesomeNotifications.createNotification(
      content: NotificationContent(
        id: createUniqueId(),
        channelKey: 'basic_channel',
        title:
            '${Emojis.money_money_bag + Emojis.plant_cactus} Buy Plant Food!!!',
        body:
            "This notification was schedule to shows at ${DateFormat.yMEd().add_jm().format(DateTime.now())}",
        bigPicture: 'asset://assets/notification_map.png',
        notificationLayout: NotificationLayout.BigPicture,
      ),
    ); */
}
