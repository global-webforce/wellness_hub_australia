import 'package:ez_ui/ez_ui.dart';
import 'package:wellness_hub_australia/app/shared/constants/dimensions.dart';
import 'package:wellness_hub_australia/app/shared/ui/empty_display.dart';
import 'package:wellness_hub_australia/app/shared/ui/list_and_grid_view_wrapper.dart';
import 'package:wellness_hub_australia/features/service_schedules/viewmodels/service_schedule_viewmodel.dart';
import 'package:wellness_hub_australia/features/service_schedules/widgets/service_schedule_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ServiceSchedulesPage extends StatelessWidget {
  const ServiceSchedulesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ServiceSchedulesViewModel>.reactive(
        viewModelBuilder: () => ServiceSchedulesViewModel(),
        onModelReady: (viewModel) async {
          await viewModel.getAll();
        },
        builder: (context, viewModel, child) {
          final serviceSchedules = viewModel.serviceSchedules;

          Widget addButton() {
            return Container(
              padding: const EdgeInsets.all(15),
              color: Theme.of(context).cardTheme.color,
              child: SizedBox(
                height: 40,
                child: EzButton.elevated(
                  leading: Icons.add,
                  title: "ADD SCHEDULE",
                  onTap: () => viewModel.goToAddPage(),
                  rounded: true,
                ),
              ),
            );
          }

          return Scaffold(
              appBar: AppBar(
                title: const Text("Manage Schedules"),
              ),
              bottomNavigationBar: addButton(),
              body: ListAndGridViewWrapper(
                isBusy: viewModel.isBusy,
                emptyIndicatorWidget: const EmptyDisplay(
                  icon: Icons.calendar_month_rounded,
                  title: "YOUR SCHEDULES HERE",
                  subtitle:
                      "Manage and organize the availability of your services",
                ),
                onRefresh: () async {
                  await viewModel.getAll();
                },
                itemCount: serviceSchedules.length,
                builder: (context, constraints) {
                  return ListView.separated(
                    padding: Dimens.sliverPadding800(constraints),
                    itemCount: serviceSchedules.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemBuilder: (context, index) {
                      return ServiceScheduleCard(
                        serviceSchedule: serviceSchedules[index],
                        onTap: () {},
                        onTapDelete: () {
                          viewModel.delete(serviceSchedules[index].id);
                        },
                      );
                    },
                  );
                },
              ));
        });
  }
}
