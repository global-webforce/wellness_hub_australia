import 'package:ez_core/ez_core.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:flutter/material.dart';

class EmptyNotifications extends StatelessWidget {
  const EmptyNotifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            "images/illustrations/empty_mails.png",
            width: 400,
          ),
        ),
        vSpaceRegular,
        const EzText.title2("No Notifications")
      ],
    );
  }
}
