import 'package:ez_core/ez_core.dart';
import 'package:wellness_hub_australia/app/models/service_schedule.model.dart';
import 'package:flutter/material.dart';

class ServiceScheduleCard extends StatelessWidget {
  final ServiceSchedule serviceSchedule;
  final Function? onTap;
  final Function? onTapDelete;
  const ServiceScheduleCard(
      {Key? key, required this.serviceSchedule, this.onTap, this.onTapDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Text(
        "${serviceSchedule.day}",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          height: 1.3,
        ),
      );
    }

    Widget description() {
      return Text(
        "${serviceSchedule.startDate?.civilianTime()} - ${serviceSchedule.endDate?.civilianTime()}",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 14,
          height: 1.3,
        ),
      );
    }

    Widget deleteButton() {
      return onTapDelete == null
          ? const SizedBox.shrink()
          : IconButton(
              onPressed: () => onTapDelete!(),
              icon: const Icon(
                Icons.delete_rounded,
                color: Colors.red,
              ));
    }

    return SizedBox(
        width: 360,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap == null ? null : () => onTap!(),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: LayoutBuilder(builder: (context, constraints) {
                return IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            hSpaceRegular,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  title(),
                                  vSpaceTiny,
                                  Expanded(child: description()),
                                ],
                              ),
                            ),
                            deleteButton()
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ));
  }
}
