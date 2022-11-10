import 'package:ez_core/ez_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class FormBuilderTimeSlot extends StatefulWidget {
  final String name;
  final String? initialValue;

  const FormBuilderTimeSlot({
    Key? key,
    this.initialValue,
    required this.name,
  }) : super(key: key);

  @override
  State<FormBuilderTimeSlot> createState() => _FormBuilderTimeSlotState();
}

class _FormBuilderTimeSlotState extends State<FormBuilderTimeSlot> {
  DateTime dateToday = DateTime.now();

  List<DateTime> formValues = [];
  String? realInitValue;

  @override
  void initState() {
    try {
      widget.initialValue!
          .split(",")
          .map((e) => DateTime.parse(e))
          .toList()
          .asMap()
          .forEach((key, value) {
        formValues.add(value);
      });
      realInitValue = formValues.join(",");
    } catch (e) {
      formValues.clear();
      formValues.add(DateTime.now());
      realInitValue = DateTime.now().toIso8601String();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormBuilderState> timeSlotFormKey =
        GlobalKey<FormBuilderState>();
    return FormBuilderField(
        initialValue: realInitValue,
        name: widget.name,
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
        ]),
        builder: (FormFieldState<dynamic> field) {
          Widget addSlotButton() {
            return IconButton(
              onPressed: () {
                setState(() {
                  formValues.add(formValues[formValues.length - 1]
                      .add(const Duration(minutes: 15)));
                  String temp = formValues.join(",");
                  field.didChange(temp.substring(0, temp.length - 1));
                });
              },
              icon: const Icon(Icons.add),
            );
          }

          Widget removeSlotButton(int index) {
            return IconButton(
              onPressed: () {
                setState(() {
                  formValues.removeAt(index);
                  String temp = formValues.join(",");
                  field.didChange(temp.substring(0, temp.length - 1));
                });
              },
              icon: const Icon(Icons.clear),
            );
          }

          return FormBuilder(
            autoFocusOnValidationFailure: true,
            enabled: true,
            key: timeSlotFormKey,
            child: Column(children: [
              for (var i = 0; i < formValues.length; i++)
                _TimePicker(
                    onChange: (date) {
                      setState(() {
                        formValues[i] = date;
                        String temp = formValues.join(",");
                        field.didChange(temp.substring(0, temp.length - 1));
                      });
                    },
                    date: formValues[i],
                    name: "timeSlot${i + 1}",
                    label: "Time Slot ${i + 1}",
                    suffix: (i == 0) ? addSlotButton() : removeSlotButton(i)),
              Text(
                formValues
                    .map((e) => e.civilianTime())
                    .toList()
                    .join(", ")
                    .toString(),
                style: const TextStyle(fontSize: 14),
              ),
            ]),
          );
        });
  }
}

/// ***********************************/

class _TimePicker extends StatelessWidget {
  final DateTime date;
  final String name;
  final String label;

  final Widget? suffix;
  final Function onChange;
  const _TimePicker({
    Key? key,
    required this.date,
    required this.name,
    required this.label,
    required this.onChange,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: FormBuilderDateTimePicker(
        onChanged: (value) {
          onChange(value);
        },
        // initialTime: TimeOfDay(hour: date.hours(), minute: date.minutes()),
        initialDate: date,
        initialValue: date,

        timePickerInitialEntryMode: TimePickerEntryMode.input,
        name: name,

        inputType: InputType.time,
        decoration: InputDecoration(
          //labelText: label,
          suffixIcon: suffix,
        ),
      ),
    );
  }
}
