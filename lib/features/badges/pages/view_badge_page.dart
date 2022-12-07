import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:wellness_hub_australia/app/shared/ui/empty_display.dart';
import 'package:wellness_hub_australia/features/badges/viewmodels/badges_viewmodel.dart';
import 'package:wellness_hub_australia/features/badges/widgets/badge_card.dart';
import 'package:wellness_hub_australia/app/shared/ui/list_and_grid_view_wrapper.dart';

import 'package:flutter/material.dart';
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
          return ListAndGridViewWrapper(
            isBusy: viewModel.isBusy,
            emptyIndicatorWidget: const EmptyDisplay(
              icon: EvaIcons.award,
              title: "No badges",
            ),
            onRefresh: () async {
              await viewModel.getAll();
            },
            itemCount: viewModel.badges.length,
            builder: (context, constraints) {
              return ListView.separated(
                padding: const EdgeInsets.all(15),
                itemCount: viewModel.badges.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
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
