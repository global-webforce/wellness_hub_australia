import 'package:ez_core/ez_core.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:wellness_hub_australia/features/task_alarm/viewmodels/task_alarm_viewmodel.dart';
import 'package:wellness_hub_australia/app/shared/ui/scaffold_body_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class AddTaskAlarmPage extends StatelessWidget {
  final int? taskId;
  const AddTaskAlarmPage({Key? key, required this.taskId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TaskAlarmViewModel>.reactive(
        viewModelBuilder: () => TaskAlarmViewModel(),
        onModelReady: (viewModel) async {
          viewModel.taskId = taskId;
        },
        builder: (context, viewModel, child) {
          return Scaffold(
              appBar: AppBar(
                title: const Text("Add Alarm"),
              ),
              body: ScaffoldBodyWrapper(
                  onRefresh: () async {},
                  builder: (context, constraints) {
                    return const Card(
                      child: _TaskAlarmForm(),
                    );
                  }));
        });
  }
}

class _TaskAlarmForm extends StatelessWidget {
  const _TaskAlarmForm({
    Key? key,
  }) : super(key: key);

  final textStyle = const TextStyle(fontWeight: FontWeight.w500);
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TaskAlarmViewModel>(context);

    Widget titleField() {
      return Text(
        "${viewModel.task?.title}",
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      );
    }

    Widget weekDayField() {
      final weekday = viewModel.task?.schedule != null
          ? viewModel.task?.schedule!.weekdays!
              .split(',') // split the text into an array
              .map((time) => time)
              .toList()
          : [DateTime.now().weekdayName()];
      return FormBuilderCheckboxGroup(
        name: "weekdays",
        initialValue: weekday,
        valueTransformer: (value) {
          return value!.join(",");
        },
        validator: (List<String?>? answers) {
          if (answers!.isEmpty) {
            return 'Select atleast one';
          }
          return null;
        },
        enabled: true,
        onChanged: (value) {
          if (value!.isEmpty) {
            viewModel.alarmFormKey.currentState!.patchValue({
              'weekdays': [DateTime.now().weekdayName()]
            });
          }
        },
        decoration: const InputDecoration(
          labelText: "Days of the Week",
        ),
        options: const [
          FormBuilderFieldOption(
            value: "Monday",
            child: Text("Monday"),
          ),
          FormBuilderFieldOption(
            value: "Tuesday",
            child: Text("Tuesday"),
          ),
          FormBuilderFieldOption(
            value: "Wednesday",
            child: Text("Wednesday"),
          ),
          FormBuilderFieldOption(
            value: "Thursday",
            child: Text("Thursday"),
          ),
          FormBuilderFieldOption(
            value: "Friday",
            child: Text("Friday"),
          ),
          FormBuilderFieldOption(
            value: "Saturday",
            child: Text("Saturday"),
          ),
          FormBuilderFieldOption(
            value: "Sunday",
            child: Text("Sunday"),
          ),
        ],
      );
    }

    Widget timeField() {
      final List<DateTime>? time = viewModel.task?.schedule != null
          ? viewModel.task?.schedule!.timeSlots!
              .split(',') // split the text into an array
              .map((time) => DateTime.parse(time))
              .toList()
          : [];
      return FormBuilderDateTimePicker(
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
        ]),
        initialValue: time!.isNotEmpty ? time[0] : DateTime.now(),
        decoration: const InputDecoration(labelText: "Time of the Day"),
        valueTransformer: (val) {
          return val!.toIso8601String();
        },
        inputType: InputType.time,
        format: DateFormat("h:mm a"),
        onChanged: (value) {},
        name: "timeSlots",
      );
    }

    Widget enableField() {
      return FormBuilderSwitch(
        initialValue: viewModel.task!.schedule != null
            ? viewModel.task!.schedule!.enabled == 1
                ? true
                : false
            : true,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          helperText: "Enable/Disable Alarm",
        ),
        name: "enabled",
        valueTransformer: (value) {
          return value == true ? 1 : 0;
        },
        title: const Text(
          "Active",
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    Widget actionButtons() {
      return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        viewModel.task?.schedule != null
            ? Wrap(
                spacing: 10,
                children: [
                  EzButton.elevated(
                    busy: viewModel.busy(busyTaskAlarmDelete),
                    background: Colors.red,
                    foreground: Colors.white,
                    leading: Icons.delete_forever,
                    title: "Delete",
                    onTap: () async {
                      await viewModel.delete(viewModel.task?.schedule?.id);
                    },
                  ),
                  EzButton.elevated(
                    busy: viewModel.busy(busyTaskAlarmUpdate),
                    background: Colors.green,
                    foreground: Colors.white,
                    leading: Icons.update,
                    title: "Update",
                    onTap: () async {
                      await viewModel.update();
                    },
                  )
                ],
              )
            : EzButton.elevated(
                busy: viewModel.isBusy,
                leading: Icons.add_alarm,
                title: "Set Alarm",
                onTap: () async {
                  await viewModel.create();
                },
              )
      ]);
    }

    return FormBuilder(
        autoFocusOnValidationFailure: true,
        skipDisabled: true,
        key: viewModel.alarmFormKey,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleField(),
              vSpaceMedium,
              weekDayField(),
              vSpaceRegular,
              timeField(),
              vSpaceRegular,
              enableField(),
              vSpaceRegular,
              actionButtons(),
            ],
          ),
        ));
  }
}
