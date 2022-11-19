import 'package:ez_dashboard/ez_drawer_button.dart';
import 'package:wellness_hub_australia/features/custom_links/widgets/custom_links_grid.dart';
import 'package:wellness_hub_australia/features/pillars/widgets/pillar_stats.dart';
import 'package:wellness_hub_australia/app/shared/ui/scaffold_body_wrapper.dart';
import 'package:wellness_hub_australia/app/shared/ui/text_typography.dart';
import 'package:wellness_hub_australia/dashboards/client_dashboard/viewmodels/client_home_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ClientHomePage extends StatelessWidget {
  const ClientHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ClientHomePageViewModel>.reactive(
        viewModelBuilder: () => ClientHomePageViewModel(),
        onModelReady: (viewModel) async {
          await viewModel.init();
        },
        builder: (context, viewModel, child) => Scaffold(
              appBar: AppBar(
                title: const Text("Dashboard"),
                leading: ezDrawerButton(context),
              ),
              body: ScaffoldBodyWrapper(
                isBusy: viewModel.isBusy,
                isFullWidth: true,
                onRefresh: (() async {
                  viewModel.init();
                }),
                builder: (context, constraints) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Welcome to Dashboard",
                        style: MyTextStyle.display2,
                      ),
                      PillarStatsWidget(),
                      SizedBox(height: 16),
                      Text(
                        "Our Partners",
                        style: MyTextStyle.display2,
                      ),
                      SizedBox(height: 16),
                      CustomLinksGridWidget(),
                    ],
                  );
                },
              ),
            ));
  }
}

class PillarStatsWidget extends StatelessWidget {
  const PillarStatsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<ClientHomePageViewModel>(context);
    return PillarStats(pillarsProgress: viewModel.pillarsProgress);
  }
}

class CustomLinksGridWidget extends StatelessWidget {
  const CustomLinksGridWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<ClientHomePageViewModel>(context);
    return CustomLinksGrid(customLinks: viewModel.customLinks);
  }
}
