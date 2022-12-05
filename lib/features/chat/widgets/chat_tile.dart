import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:ez_core/ez_core.dart';
import 'package:ez_ui/ez_ui.dart';

import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class MyCustomMessages implements timeago.LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => '';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'now';
  @override
  String aboutAMinute(int minutes) => '${minutes}m';
  @override
  String minutes(int minutes) => '${minutes}m';
  @override
  String aboutAnHour(int minutes) => '${minutes}m';
  @override
  String hours(int hours) => '${hours}h';
  @override
  String aDay(int hours) => '${hours}h';
  @override
  String days(int days) => '${days}d';
  @override
  String aboutAMonth(int days) => '${days}d';
  @override
  String months(int months) => '${months}mo';
  @override
  String aboutAYear(int year) => '${year}mo';
  @override
  String years(int years) => '${years}yrs';
  @override
  String wordSeparator() => ' ';
}

class ChatTile extends StatelessWidget {
  final ChatUser chatUser;
  final Function onTap;
  const ChatTile({Key? key, required this.chatUser, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('en', MyCustomMessages());

    Widget avatar() {
      return EzAvatar(
        name: "${chatUser.firstName} ${chatUser.lastName}",
        imgUrl: "${chatUser.profileImage}",
        radius: 25,
      );
    }

    Widget name() {
      return Text(
        "${chatUser.firstName} ${chatUser.lastName} #${chatUser.customProperties?["thread_id"]}",
        style: const TextStyle(fontWeight: FontWeight.bold),
      );
    }

    Widget date() {
      final DateTime date =
          DateTime.parse(chatUser.customProperties?["created_at"]);
      return Tooltip(
        message: "${date.toDateTime()}",
        child: Text(
          timeago.format(date),
        ),
      );
    }

    Widget body() {
      return Text(
        "${chatUser.customProperties?["text"]}",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    }

    return ListTile(
      onTap: () => onTap(),
      leading: avatar(),
      title: name(),
      dense: false,
      visualDensity: VisualDensity.comfortable,
      subtitle: body(),
      trailing: date(),
    );
  }
}
