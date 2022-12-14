import 'package:auto_route/auto_route.dart';
import 'package:ez_dashboard/screen_size_helper.dart';
import 'package:wellness_hub_australia/app/shared/ui/sliver_grid_delegate.dart';
import 'package:wellness_hub_australia/features/pillars/widgets/pillar_progress_card.dart';
import 'package:wellness_hub_australia/features/tasks/pages/tasks_page.dart';
import 'package:wellness_hub_australia/app/models/pillar_progress.model.dart';
import 'package:flutter/material.dart';

class PillarProgressGrid extends StatelessWidget {
  final List<PillarProgress> pillars;
  const PillarProgressGrid({Key? key, required this.pillars}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return pillars.isEmpty
        ? const SizedBox.shrink()
        : CustomScrollView(
            shrinkWrap: true,
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            slivers: <Widget>[
              SliverGrid(
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                  crossAxisCount: isMobile(context) ? 1 : 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  height: 95,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int i) {
                    return PillarProgressCard(
                        pillar: pillars[i],
                        onTap: () {
                          context.router.root.pushWidget(
                            TasksPage(pillarId: pillars[i].id),
                            transitionBuilder: TransitionsBuilders.zoomIn,
                          );
                        });
                  },
                  childCount: pillars.length,
                ),
              ),
            ],
          );
  }
}
