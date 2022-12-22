import 'package:ez_core/ez_core.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DayAndTimeSlotPicker extends StatefulWidget {
  final DateTime? initialValue;
  final Function(DateTime)? onDateChange;
  final Function(DateTime)? onTimeChange;
  final bool Function(DateTime) daysPredicate;
  final bool Function(DateTime) timePredicate;

  const DayAndTimeSlotPicker({
    Key? key,
    required this.daysPredicate,
    required this.timePredicate,
    this.onDateChange,
    this.onTimeChange,
    this.initialValue,
  }) : super(key: key);

  @override
  State<DayAndTimeSlotPicker> createState() => _DayAndTimeSlotPickerState();
}

class _DayAndTimeSlotPickerState extends State<DayAndTimeSlotPicker> {
  final ItemScrollController itemScrollController = ItemScrollController();

  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  List<DateTime> dateSlots = [];
  List<DateTime> timeSlots = [];

  initialize() {
    DateTime startTime = DateTime.now().copyWith(
        hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);
    DateTime endTime = DateTime.now().add(const Duration(days: 60)).copyWith(
        hour: 23, minute: 59, second: 0, millisecond: 0, microsecond: 0);
    while (startTime.isBefore(endTime)) {
      dateSlots.add(startTime);
      DateTime timeIncrement = startTime.add(const Duration(days: 1));
      startTime = timeIncrement;
    }
  }

  @override
  void initState() {
    initialize();
    super.initState();
  }

  DateTime? selectedDayDate;
  DateTime? selectedTimeDate;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select Date",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        vSpaceSmall,
        SizedBox(
          height: 92,
          width: double.infinity,
          child: ScrollablePositionedList.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dateSlots.length,
            itemBuilder: (context, i) => widget.daysPredicate(dateSlots[i])
                ? Container(
                    margin: const EdgeInsets.all(3),
                    width: 60,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      color: selectedDayDate == dateSlots[i]
                          ? HexColor("#8959B0")
                          : Colors.grey,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedDayDate = dateSlots[i];
                            widget.onDateChange!(dateSlots[i]);
                            itemScrollController.scrollTo(
                                index: i,
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeInCubic);
                            DateTime startTime = dateSlots[i].copyWith(
                                hour: 0,
                                minute: 0,
                                second: 0,
                                millisecond: 0,
                                microsecond: 0);
                            DateTime endTime = dateSlots[i].copyWith(
                                hour: 23,
                                minute: 59,
                                second: 0,
                                millisecond: 0,
                                microsecond: 0);

                            timeSlots = [];
                            while ((startTime.isBefore(endTime) ||
                                startTime.difference(endTime).inMinutes < 1)) {
                              timeSlots.add(startTime);

                              DateTime timeIncrement =
                                  startTime.add(const Duration(hours: 1));
                              startTime = timeIncrement;
                            }
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                DateFormat("MMMM")
                                    .format(dateSlots[i])
                                    .substring(0, 3)
                                    .toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                "${dateSlots[i].day}",
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                DateFormat("EEEE")
                                    .format(dateSlots[i])
                                    .substring(0, 3)
                                    .toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            itemScrollController: itemScrollController,
            itemPositionsListener: itemPositionsListener,
          ),
        ),
        vSpaceSmall,
        const Text(
          "Choose Time",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        vSpaceSmall,
        timeSlots.where((e) => widget.timePredicate(e)).toList().isEmpty
            ? const Text("No available time on this day.")
            : Wrap(
                alignment: WrapAlignment.start,
                children: timeSlots
                    .map((e) => widget.timePredicate(e)
                        ? Tooltip(
                            message: e.toDateTime(),
                            child: Padding(
                              padding: const EdgeInsets.all(3),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedTimeDate = e;
                                    widget.onTimeChange!(e);
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: selectedTimeDate == e
                                          ? HexColor("#8959B0")
                                          : Colors.grey,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Text(
                                      "${e.civilianTime()}",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink())
                    .toList(),
              )
      ],
    );
  }
}
