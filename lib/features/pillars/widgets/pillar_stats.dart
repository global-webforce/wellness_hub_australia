import 'package:wellness_hub_australia/features/pillars/widgets/pillar_progress_grid.dart';
import 'package:wellness_hub_australia/models/pillar_progress.model.dart';

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'pillar_progress_circle.dart';

class PillarStats extends StatelessWidget {
  final List<PillarProgress> pillarsProgress;
  const PillarStats({
    Key? key,
    required this.pillarsProgress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) {
        return Column(
          children: [
            PillarProgressCircle(pillars: pillarsProgress),
            PillarProgressGrid(
              pillars: pillarsProgress,
            )
          ],
        );
      },
      tablet: (BuildContext context) {
        return Row(
          children: [
            PillarProgressCircle(pillars: pillarsProgress),
            Expanded(
                child: PillarProgressGrid(
              pillars: pillarsProgress,
            )),
          ],
        );
      },
    );
  }
}
