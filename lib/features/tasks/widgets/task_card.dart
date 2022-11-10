import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ez_core/ez_core.dart';
import 'package:wellness_hub_australia/models/task.model.dart';

import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final Task? task;
  final Function onTap;
  final Function? onTapAlarm;
  const TaskCard(
      {Key? key, required this.task, required this.onTap, this.onTapAlarm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget image(double width) {
      return Card(
        color: Colors.white,
        child: CachedNetworkImage(
          imageUrl: "${task!.imgUrl}",
          width: max(width * 0.13, 80),
          height: max(width * 0.13, 80),
          errorWidget: (context, url, error) {
            return Card(
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                "/images/placeholder.png",
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      );
    }

    Widget frequency() {
      Color? color;
      String? text;
      switch (task!.frequency) {
        case "daily":
          color = Colors.blue;
          text = "Today";
          break;
        case "weekly":
          color = Colors.green;
          text = "This Week";
          break;
        case "monthly":
          color = Colors.orange;
          text = "This Month";
          break;
        case "once":
          color = Colors.red;
          text = "Try it!";
          break;
        default:
      }
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color!.withOpacity(0.8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            text!.toTitleCase(),
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
      );
    }

    Widget title() {
      return Text(
        "${task!.title}",
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      );
    }

    Widget description() {
      return Text(
        "${task!.description}",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 12,
        ),
      );
    }

    Widget alarm() {
      return IconButton(
        onPressed: onTapAlarm != null ? () => onTapAlarm!() : null,
        icon: task!.schedule != null
            ? const Icon(
                Icons.alarm,
                color: Colors.green,
              )
            : const Icon(
                Icons.alarm,
                color: Colors.grey,
              ),
      );
    }

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => onTap(),
        child: LayoutBuilder(builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                image(constraints.maxWidth),
                hSpaceSmall,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      frequency(),
                      const SizedBox(height: 4),
                      title(),
                      const SizedBox(height: 8),
                      description()
                    ],
                  ),
                ),
                hSpaceTiny,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    task!.taskProgressId != null
                        ? const Icon(
                            Icons.check_circle_rounded,
                            color: Colors.green,
                          )
                        : const SizedBox.shrink(),
                    /*    _checkbox(),*/
                    alarm(),
                  ],
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
