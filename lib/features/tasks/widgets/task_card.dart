import 'package:cached_network_image/cached_network_image.dart';
import 'package:wellness_hub_australia/app/models/task.model.dart';

import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final Task? task;
  final Color? color;
  final Function onTap;
  final Function? onTapAlarm;
  const TaskCard(
      {Key? key,
      required this.task,
      required this.onTap,
      this.onTapAlarm,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget image(double width) {
      return Card(
        elevation: 0,
        color: Colors.white,
        child: CachedNetworkImage(
          imageUrl: "${task!.imgUrl}",
          fit: BoxFit.contain,
          width: 70,
          height: 70,
          placeholder: (context, url) {
            return Card(
              elevation: 0,
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                "assets/images/placeholder.png",
                fit: BoxFit.cover,
              ),
            );
          },
          errorWidget: (context, url, error) {
            return Card(
              elevation: 0,
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                "assets/images/placeholder.png",
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      );
    }

    Widget frequency() {
      String? text;
      switch (task!.frequency) {
        case "daily":
          text = "Daily";
          break;
        case "weekly":
          text = "Weekly";
          break;
        case "monthly":
          text = "Monthly";
          break;
        case "once":
          text = "Discover";
          break;
        default:
      }
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            text!.toUpperCase(),
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
      );
    }

    Widget title() {
      return Text(
        "${task!.title}",
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      );
    }

    Widget description() {
      return Text(
        "${task!.description}",
        style: const TextStyle(
          fontSize: 12,
        ),
      );
    }

    return Card(
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 8,
                  children: [
                    frequency(),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    image(constraints.maxWidth),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [title(), description()],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Material(
                        color: task!.schedule != null ? color : Colors.grey,
                        child: InkWell(
                          onTap:
                              onTapAlarm != null ? () => onTapAlarm!() : null,
                          child: Align(
                            alignment: Alignment.center,
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 5,
                              children: [
                                task!.schedule != null
                                    ? const Icon(Icons.alarm_on_outlined,
                                        color: Colors.white)
                                    : const Icon(Icons.alarm_off_outlined,
                                        color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const VerticalDivider(
                      width: 1,
                    ),
                    Expanded(
                      child: Material(
                        color:
                            task!.taskProgressId != null ? color : Colors.grey,
                        child: InkWell(
                          onTap: () => onTap(),
                          child: Align(
                            alignment: Alignment.center,
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 5,
                              children: [
                                task!.taskProgressId != null
                                    ? const Icon(Icons.check,
                                        color: Colors.white)
                                    : const Icon(Icons.visibility_outlined,
                                        color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
