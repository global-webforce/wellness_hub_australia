import 'package:ez_core/ez_core.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:flutter/material.dart';

class EmptyScheduleService extends StatelessWidget {
  const EmptyScheduleService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "images/illustrations/schedules.png",
          width: 500,
        ),
        vSpaceRegular,
        const EzText.title2("Schedule your services availability")
      ],
    );
  }
}
