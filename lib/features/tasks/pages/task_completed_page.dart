import 'package:ez_core/ez_core.dart';
import 'package:wellness_hub_australia/app/shared/ui/scaffold_body_wrapper.dart';
import 'package:flutter/material.dart';

class TaskCompletedPage extends StatelessWidget {
  const TaskCompletedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ScaffoldBodyWrapper(
            centered: true,
            builder: (context, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.check_circle,
                    size: 48,
                    color: Colors.green,
                  ),
                  vSpaceRegular,
                  Text(
                    "Task Completed!",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              );
            }));
  }
}
