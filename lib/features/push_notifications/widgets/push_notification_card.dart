import 'package:ez_core/ez_core.dart';
import 'package:wellness_hub_australia/models/push_notification.model.dart';
import 'package:flutter/material.dart';

class PushNotificationCard extends StatelessWidget {
  final PushNotification push_notification;
  final Function onTap;
  const PushNotificationCard(
      {Key? key, required this.push_notification, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget date() {
      return Text(
        "${push_notification.createdAt}".toDateNotification(),
        style: const TextStyle(
          fontSize: 13,
        ),
      );
    }

    Widget title() {
      return Text(
        "${push_notification.notification}",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      );
    }

    Widget body() {
      return Text(
        "${push_notification.notification}",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 13,
        ),
      );
    }

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => onTap(),
        child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      title(),
                      vSpaceTiny,
                      body(),
                    ],
                  ),
                ),
                hSpaceTiny,
                date(),
              ],
            )),
      ),
    );
  }
}
