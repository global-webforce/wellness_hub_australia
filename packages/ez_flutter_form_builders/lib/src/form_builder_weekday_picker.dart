import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:weekday_selector/weekday_selector.dart';

class FormBuilderWeekdayPicker extends StatefulWidget {
  final String name;
  final String? initialValue;
  const FormBuilderWeekdayPicker(
      {Key? key, this.initialValue, required this.name})
      : super(key: key);
  @override
  State<FormBuilderWeekdayPicker> createState() =>
      _FormBuilderWeekdayPickerState();
}

class _FormBuilderWeekdayPickerState extends State<FormBuilderWeekdayPicker> {
  DateTime dateToday = DateTime.now();

  void checkNoneSelected() {
    if ((!daysOfTheWeek.any((day) => day == true))) {
      try {
        if (widget.initialValue != null) {
          List<int> defaultValue =
              widget.initialValue!.split(",").map((e) => int.parse(e)).toList();
          for (var i = 0; i < defaultValue.length; i++) {
            daysOfTheWeek[defaultValue[i] % 7] = true;
          }
        } else {
          daysOfTheWeek[dateToday.weekday % 7] = true;
        }
      } catch (e) {
        daysOfTheWeek[dateToday.weekday % 7] = true;
      }
    }
  }

  List<bool> daysOfTheWeek = List.filled(7, false);

  @override
  void initState() {
    super.initState();
    checkNoneSelected();
  }

  String daysOfTheWeekToName() {
    List<String> temp = [];
    for (var i = 0; i < daysOfTheWeek.length; i++) {
      if (daysOfTheWeek[i] == true) {
        switch (i) {
          case 0:
            temp.add("Sun");
            break;
          case 1:
            temp.add("Mon");
            break;
          case 2:
            temp.add("Tue");
            break;
          case 3:
            temp.add("Wed");
            break;
          case 4:
            temp.add("Thu");
            break;
          case 5:
            temp.add("Fri");
            break;
          case 6:
            temp.add("Sat");
            break;
          default:
        }
      }
    }
    return temp.join(', ').toString();
  }

  String daysOfTheWeekToNumber() {
    List<int> temp = [];
    for (var i = 0; i < daysOfTheWeek.length; i++) {
      if (daysOfTheWeek[i] == true) {
        switch (i) {
          case 0:
            //Sunday
            temp.add(7);
            break;
          case 1:
            temp.add(1);
            break;
          case 2:
            temp.add(2);
            break;
          case 3:
            temp.add(3);
            break;
          case 4:
            temp.add(4);
            break;
          case 5:
            temp.add(5);
            break;
          case 6:
            temp.add(6);
            break;
          default:
        }
      }
    }
    return temp.join(', ').toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormBuilderField(
          initialValue: "${DateTime.now().weekday}",
          name: widget.name,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
          ]),
          builder: (FormFieldState<dynamic> field) {
            return WeekdaySelector(
              firstDayOfWeek: 0,
              elevation: 5,
              values: daysOfTheWeek,
              onChanged: (int selectedDay) {
                setState(() {
                  final index = selectedDay % 7;
                  if (index == 0) {
                    //It's sunday
                    daysOfTheWeek[0] = !daysOfTheWeek[0];
                  } else {
                    daysOfTheWeek[index] = !daysOfTheWeek[index];
                  }
                  checkNoneSelected();
                });
                field.didChange(daysOfTheWeekToNumber());
              },
            );
          },
        ),
        Text(
          daysOfTheWeekToName().toString(),
          style: const TextStyle(fontSize: 14),
        )
      ],
    );
  }
}
