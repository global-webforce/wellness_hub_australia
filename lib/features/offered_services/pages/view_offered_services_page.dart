import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:wellness_hub_australia/app/shared/constants/dimensions.dart';
import 'package:wellness_hub_australia/app/shared/ui/empty_display.dart';
import 'package:wellness_hub_australia/features/offered_services/viewmodels/offered_services_viewmodel.dart';
import 'package:wellness_hub_australia/features/offered_services/widgets/offered_service_card.dart';
import 'package:wellness_hub_australia/app/shared/ui/list_gridview_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
              body: ListGridViewWrapper(
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
                  return AlignedGridView.count(
                    padding: Dimens.sliverPadding800(constraints),
                    crossAxisCount: 1,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    itemCount: offeredServices.length,
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
