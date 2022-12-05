import 'package:ez_ui/ez_ui.dart';
import 'package:wellness_hub_australia/app/models/task.model.dart';
import 'package:flutter/material.dart';

extension TaskHelper on Task {
  Widget statusWidget() {
    if (taskProgressId != null) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          child: EzText.caption(
            "Finished",
            fontColor: Colors.white,
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
