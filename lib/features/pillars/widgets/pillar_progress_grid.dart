import 'package:auto_route/auto_route.dart';
import 'package:ez_core/ez_core.dart';
import 'package:wellness_hub_australia/features/pillars/widgets/pillar_progress_card.dart';
import 'package:wellness_hub_australia/features/tasks/pages/tasks_page.dart';
import 'package:wellness_hub_australia/models/pillar_progress.model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PillarProgressGrid extends StatelessWidget {
  final List<PillarProgress> pillars;
  const PillarProgressGrid({Key? key, required this.pillars}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlignedGridView.count(
        shrinkWrap: true,
        primary: false,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: isMobile(context) ? 1 : 2,
        itemCount: pillars.length,
        itemBuilder: (ctx, i) {
          return AnimationConfiguration.staggeredList(
            position: i,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50.0,
              key: UniqueKey(),
              child: ScaleAnimation(
                delay: const Duration(milliseconds: 375),
                child: PillarProgressCard(
                    pillar: pillars[i],
                    onTap: () {
                      context.router.root.pushWidget(
                        TasksPage(pillarId: pillars[i].id),
                        transitionBuilder: TransitionsBuilders.fadeIn,
                      );
                    }),
              ),
            ),
          );
        });
  }
}
