import 'package:ez_core/ez_core.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:stacked/stacked.dart';
import 'package:wellness_hub_australia/app/app.viewmodels_busy_keys.dart';

import 'package:wellness_hub_australia/features/appointments/appointments/viewmodels/appointments_viewmodel.dart';

class AppointmentUpdateCard extends StatelessWidget {
  const AppointmentUpdateCard({
    Key? key,
  }) : super(key: key);

  final textStyle = const TextStyle(fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<AppointmentViewModel>(context);

    Widget paidField() {
      return FormBuilderDropdown(
          name: 'paid',
          initialValue: "${viewModel.getSelectedAppointment?.paid}",
          valueTransformer: (value) => int.parse("$value"),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(12, 16, 0, 16),
            labelText: "Is Paid?",
            suffixIcon: IconButton(
              splashRadius: 15,
              constraints: const BoxConstraints(),
              onPressed: () {},
              icon: const Icon(Icons.clear),
            ),
          ),
          validator:
              FormBuilderValidators.compose([FormBuilderValidators.required()]),
          items: const [
            DropdownMenuItem(
              value: "1",
              child: Text('Yes'),
            ),
            DropdownMenuItem(
              value: "0",
              child: Text('No'),
            ),
          ]);
    }

    Widget statusField() {
      return FormBuilderDropdown(
          //   key: const Key("DSFSFSFSDF"),
          name: 'status',
          initialValue: "${viewModel.getSelectedAppointment?.status}",
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(12, 16, 0, 16),
            labelText: "Status",
            suffixIcon: IconButton(
              splashRadius: 15,
              constraints: const BoxConstraints(),
              onPressed: () {},
              icon: const Icon(Icons.clear),
            ),
          ),
          validator:
              FormBuilderValidators.compose([FormBuilderValidators.required()]),
          items: const [
            DropdownMenuItem(
              value: "Pending",
              child: Text('Pending'),
            ),
            DropdownMenuItem(
              value: "Confirmed",
              child: Text('Confirmed'),
            ),
            DropdownMenuItem(
              value: "Completed",
              child: Text('Completed'),
            ),
            DropdownMenuItem(
              value: "Missed",
              child: Text('Missed'),
            ),
            DropdownMenuItem(
              value: "Cancelled",
              child: Text('Cancelled'),
            ),
          ]);
    }

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "STATUS UPDATE",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            vSpaceRegular,
            FormBuilder(
              onChanged: () {
                viewModel.editMode = true;
              },
              key: viewModel.appointmentFormKey,
              autoFocusOnValidationFailure: true,
              skipDisabled: true,
              child: StaggeredGrid.count(
                crossAxisCount: 1,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                children: [
                  StaggeredGridTile.fit(
                    crossAxisCellCount: 1,
                    child: paidField(),
                  ),
                  StaggeredGridTile.fit(
                    crossAxisCellCount: 1,
                    child: statusField(),
                  ),
                  StaggeredGridTile.fit(
                    crossAxisCellCount: 1,
                    child: Row(
                      children: [
                        EzButton.elevated(
                            busy: viewModel
                                .busy(ViewModelBusyKeys.appointmentUpdate),
                            title: "Save",
                            onTap: viewModel.editMode
                                ? () {
                                    viewModel.update();
                                  }
                                : null),
                        hSpaceSmall,
                        viewModel.editMode
                            ? EzButton.elevated(
                                title: "Reset",
                                background: Colors.grey,
                                onTap: () {
                                  viewModel.appointmentFormKey.currentState
                                      ?.reset();
                                })
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
