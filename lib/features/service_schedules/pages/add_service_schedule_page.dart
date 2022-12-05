import 'package:ez_ui/ez_ui.dart';
import 'package:wellness_hub_australia/features/service_schedules/viewmodels/service_schedule_viewmodel.dart';
import 'package:wellness_hub_australia/app/shared/ui/scaffold_body_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:stacked/stacked.dart';

class AddServiceSchedulePage extends StatelessWidget {
  const AddServiceSchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ServiceSchedulesViewModel>.reactive(
        viewModelBuilder: () => ServiceSchedulesViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
              appBar: AppBar(
                title: const Text("Add Service Schedule"),
              ),
              body: ScaffoldBodyWrapper(
                  onRefresh: () async {},
                  builder: (context, constraints) {
                    return const Card(
                      child: _ServiceScheduleForm(),
                    );
                  }));
        });
  }
}

class _ServiceScheduleForm extends StatelessWidget {
  const _ServiceScheduleForm({
    Key? key,
  }) : super(key: key);

  final textStyle = const TextStyle(fontWeight: FontWeight.w500);
  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<ServiceSchedulesViewModel>(context);

    Widget dayField() {
      final days = [
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday",
        "Sunday"
      ];
      return FormBuilderDropdown(
        name: 'day',
        decoration: const InputDecoration(
          labelText: 'Day of the Week',
          hintText: 'Select Day',
        ),
        validator:
            FormBuilderValidators.compose([FormBuilderValidators.required()]),
        items: days
            .map((day) => DropdownMenuItem(
                  value: day,
                  child: Text(day),
                ))
            .toList(),
      );
    }

    Widget startDateField() {
      return FormBuilderDateTimePicker(
        name: "start_date",
        inputType: InputType.time,
        valueTransformer: (value) {
          return value?.toIso8601String();
        },
        onChanged: (value) {},
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: const InputDecoration(
            labelText: "Start Time",
            prefixIcon: Icon(Icons.punch_clock_rounded)),
      );
    }

    Widget endDateField() {
      return FormBuilderDateTimePicker(
        name: "end_date",
        inputType: InputType.time,
        valueTransformer: (value) {
          return value?.toIso8601String();
        },
        onChanged: (value) {},
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: const InputDecoration(
            labelText: "End Time", prefixIcon: Icon(Icons.punch_clock_rounded)),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          FormBuilder(
            autoFocusOnValidationFailure: true,
            skipDisabled: true,
            key: viewModel.serviceScheduleFormKey,
            child: StaggeredGrid.count(
              crossAxisCount: 1,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              children: [
                StaggeredGridTile.fit(
                  crossAxisCellCount: 1,
                  child: dayField(),
                ),
                StaggeredGridTile.fit(
                  crossAxisCellCount: 1,
                  child: startDateField(),
                ),
                StaggeredGridTile.fit(
                  crossAxisCellCount: 1,
                  child: endDateField(),
                ),
                StaggeredGridTile.fit(
                  crossAxisCellCount: 1,
                  child: Row(
                    children: [
                      EzButton.elevated(
                        busy: viewModel.isBusy,
                        title: "Save",
                        onTap: () async {
                          await viewModel.create();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
