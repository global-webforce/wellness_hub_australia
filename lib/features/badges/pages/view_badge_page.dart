import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ez_core/ez_core.dart';
import 'package:wellness_hub_australia/app/shared/ui/empty_display.dart';
import 'package:wellness_hub_australia/features/badges/viewmodels/badges_viewmodel.dart';
import 'package:wellness_hub_australia/features/badges/widgets/badge_card.dart';
import 'package:wellness_hub_australia/app/shared/ui/list_gridview_wrapper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:stacked/stacked.dart';

class BadgesPage extends StatelessWidget {
  const BadgesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Badges"),
      ),
      body: ViewModelBuilder<BadgesViewModel>.reactive(
        viewModelBuilder: () => BadgesViewModel(),
        onModelReady: (viewModel) async {
          await viewModel.getAll();
        },
        builder: (context, viewModel, child) {
          return ListGridViewWrapper(
            isBusy: viewModel.isBusy,
            emptyIndicatorWidget: const EmptyDisplay(
              icon: EvaIcons.award,
              title: "You have no badges",
              subtitle:
                  "Take tasks seriously to achieve badges and get rewards",
            ),
            onRefresh: () async {
              await viewModel.getAll();
            },
            itemCount: viewModel.badges.length,
            builder: (context, constraints) {
              return AlignedGridView.count(
                padding: const EdgeInsets.all(15),
                crossAxisCount: isMobile(context) ? 1 : 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                itemCount: viewModel.badges.length,
                itemBuilder: (context, index) {
                  return BadgeCard(
                    badge: viewModel.badges[index],
                    onTap: () {},
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
