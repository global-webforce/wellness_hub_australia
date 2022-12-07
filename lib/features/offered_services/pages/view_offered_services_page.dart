import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:wellness_hub_australia/app/shared/constants/dimensions.dart';
import 'package:wellness_hub_australia/app/shared/ui/empty_display.dart';
import 'package:wellness_hub_australia/features/offered_services/viewmodels/offered_services_viewmodel.dart';
import 'package:wellness_hub_australia/features/offered_services/widgets/offered_service_card.dart';
import 'package:wellness_hub_australia/app/shared/ui/list_and_grid_view_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ViewOfferedServicesPage extends StatelessWidget {
  const ViewOfferedServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OfferedServicesViewModel>.reactive(
        viewModelBuilder: () => OfferedServicesViewModel(),
        onModelReady: (viewModel) async {
          viewModel.getAll();
        },
        builder: (context, viewModel, child) {
          final offeredServices = viewModel.offeredServices;

          Widget addButton() {
            return Container(
              padding: const EdgeInsets.all(15),
              color: Theme.of(context).cardTheme.color,
              child: SizedBox(
                height: 40,
                child: EzButton.elevated(
                  leading: Icons.add,
                  title: "ADD OFFERED SERVICE",
                  onTap: () => viewModel.goToAddPage(),
                  rounded: true,
                ),
              ),
            );
          }

          return Scaffold(
              appBar: AppBar(
                title: const Text("Manage Offered Services"),
              ),
              bottomNavigationBar: addButton(),
              body: ListAndGridViewWrapper(
                isBusy: viewModel.isBusy,
                emptyIndicatorWidget: const EmptyDisplay(
                  icon: EvaIcons.heart,
                  title: "WHAT SERVICES DO YOU OFFER?",
                  subtitle: "Show the services you can offer to the clients",
                ),
                onRefresh: () async {
                  await viewModel.getAll();
                },
                itemCount: offeredServices.length,
                builder: (context, constraints) {
                  return ListView.separated(
                    padding: Dimens.sliverPadding800(constraints),
                    itemCount: offeredServices.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemBuilder: (context, index) {
                      return OfferedServiceCard(
                        offeredService: offeredServices[index],
                        onTap: () {},
                        onTapDelete: () async {
                          await viewModel.delete(offeredServices[index].id);
                        },
                      );
                    },
                  );
                },
              ));
        });
  }
}
