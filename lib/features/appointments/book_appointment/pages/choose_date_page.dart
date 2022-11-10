import 'package:ez_core/ez_core.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:wellness_hub_australia/features/appointments/book_appointment/book_appointment_viewmodel.dart';
import 'package:wellness_hub_australia/features/service_providers/widgets/day_and_time_slot_picker.dart';
import 'package:wellness_hub_australia/app/shared/ui/scaffold_body_wrapper.dart';
import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ChooseAppointmentPage extends StatefulWidget {
  const ChooseAppointmentPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ChooseAppointmentPage> createState() => _ChooseAppointmentPageState();
}

class _ChooseAppointmentPageState extends State<ChooseAppointmentPage> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<BookAppointmentViewModel>(
      context,
      listen: false,
    );
    final serviceProvider = viewModel.selectedServiceProvider;

    Widget avatar() {
      return EzAvatar(
        firstName: "${serviceProvider?.firstName} ${serviceProvider?.lastName}",
        imgUrl: serviceProvider?.profilePic,
      );
    }

    Widget name() {
      return Text(
        "${serviceProvider?.firstName} ${serviceProvider?.lastName}",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      );
    }

    Widget serviceSelected() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: HexColor("${viewModel.selectedPillar?.colorTheme}"),
        ),
        child: Text(
          "${viewModel.selectedField?.title}",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      );
    }

    Widget serviceSelectedAmount() {
      return Text(
        "${serviceProvider!.offeredServices.firstWhere((e) => e.fieldId == viewModel.selectedFieldId).ratePerHour?.moneyFormat()} / hr",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
      );
    }

    Widget selectAvailability() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DayAndTimeSlotPicker(
            daysPredicate: (day) {
              return serviceProvider!.schedules
                  .any((date) => date.day == DateFormat('EEEE').format(day));
            },
            timePredicate: (time) {
              return serviceProvider!.schedules.any((date) {
                if (date.day == DateFormat('EEEE').format(time)) {
                  if (time.isBetween(
                            time.copyWith(
                                hour: date.startDate?.hour,
                                minute: date.startDate?.minute),
                            time.copyWith(
                              hour: date.endDate?.hour,
                              minute: date.endDate?.minute,
                            ),
                          ) ==
                          true &&
                      time.isAfterOrEqualTo(DateTime.now()) == true) {
                    return true;
                  }
                }

                return false;
              });
            },
            onDateChange: (selectedDate) {
              viewModel.selectedDate = selectedDate;
            },
            onTimeChange: (selectedTime) {
              viewModel.selectedTime = selectedTime;
            },
          ),
        ],
      );
    }

    Widget paymentTypeField() {
      final paymentTypes = [
        "Card",
        "Cash",
        "Cheque",
      ];
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Choose Payment type",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          vSpaceSmall,
          FormBuilderDropdown(
            name: 'payment_type',
            decoration: const InputDecoration(),
            onChanged: (i) {
              viewModel.selectedPaymentType = "$i";
            },
            initialValue: "Cash",
            validator: FormBuilderValidators.compose(
                [FormBuilderValidators.required()]),
            items: paymentTypes
                .map((day) => DropdownMenuItem(
                      value: day,
                      child: Text(day),
                    ))
                .toList(),
          ),
        ],
      );
    }

    return Scaffold(
        body: ScaffoldBodyWrapper(
            isEmpty: viewModel.selectedServiceProvider == null,
            isBusy: viewModel.isBusy,
            onRefresh: () async {
              await viewModel.findOneAsync();
            },
            builder: (context, constraints) {
              return Stack(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            const SizedBox(height: 60),
                            name(),
                            vSpaceTiny,
                            serviceSelected(),
                            vSpaceSmall,
                            serviceSelectedAmount(),
                            vSpaceSmall,
                            const Divider(height: 30),
                            selectAvailability(),
                            vSpaceMedium,
                            paymentTypeField(),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Align(alignment: Alignment.topCenter, child: avatar()),
              ]);
            }));
  }
}
