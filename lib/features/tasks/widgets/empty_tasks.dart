import 'package:ez_core/ez_core.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:flutter/material.dart';

class EmptyTasks extends StatelessWidget {
  const EmptyTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            "images/illustrations/achieve_tasks.png",
            width: 500,
          ),
        ),
        vSpaceRegular,
        const EzText.title2(
          "Make yourself better with out planned tasks program",
          align: TextAlign.center,
        )
      ],
    );
  }
}
