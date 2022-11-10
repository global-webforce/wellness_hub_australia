import 'package:ez_core/ez_core.dart';
import 'package:wellness_hub_australia/features/appointments/appointments/viewmodels/appointments_viewmodel.dart';
import 'package:wellness_hub_australia/features/appointments/appointments/widgets/appointment_detail_card.dart';
import 'package:wellness_hub_australia/features/appointments/appointments/widgets/appointment_update_card.dart';
import 'package:wellness_hub_australia/app/shared/ui/scaffold_body_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AppointmentDetailPage extends StatelessWidget {
  final int appointmentId;
  const AppointmentDetailPage({Key? key, required this.appointmentId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppointmentViewModel>.reactive(
        viewModelBuilder: () => AppointmentViewModel(),
        onModelReady: (viewModel) {
          viewModel.selectedAppointmentId = appointmentId;
        },
        builder: (context, viewModel, child) {
          return Scaffold(
              appBar: AppBar(
                title: const Text("Booking Detail"),
              ),
              body: ScaffoldBodyWrapper(onRefresh: () async {
                await viewModel.getAll();
              }, builder: (context, constraints) {
                return Column(
                  children: const [
                    AppointmentDetailCard(),
                    vSpaceRegular,
                    AppointmentUpdateCard()
                  ],
                );
              }));
        });
  }
}
