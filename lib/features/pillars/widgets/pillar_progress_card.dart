import 'package:cached_network_image/cached_network_image.dart';
import 'package:ez_core/ez_core.dart';
import 'package:wellness_hub_australia/features/pillars/pillar_progress_extension.dart';
import 'package:wellness_hub_australia/app/models/pillar_progress.model.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PillarProgressCard extends StatelessWidget {
  final PillarProgress pillar;
  final Function onTap;
  const PillarProgressCard(
      {Key? key, required this.pillar, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget icon(double width) {
      return Card(
        color: HexColor("${pillar.colorTheme}"),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CachedNetworkImage(
            imageUrl: "${pillar.pillarIcon}",
            width: 50,
            height: 50,
            fit: BoxFit.contain,
            color: Colors.white,
            placeholder: (context, url) {
              return Image.asset(
                "assets/images/logo_basic.png",
                fit: BoxFit.contain,
                color: Colors.white,
              );
            },
            errorWidget: (context, url, error) {
              return Image.asset(
                "assets/images/logo_basic.png",
                fit: BoxFit.contain,
                color: Colors.white,
              );
            },
          ),
        ),
      );
    }

    Widget title() {
      return Text(
        "${pillar.title}".toUpperCase(),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
            //  color: HexColor("${pillar.colorTheme}"),
            fontSize: 18,
            height: 1.3,
            fontWeight: FontWeight.w600),
      );
    }

    Widget percentIndicator() => LinearPercentIndicator(
          padding: const EdgeInsets.all(0),
          animateFromLastPercent: true,
          animation: true,
          barRadius: const Radius.circular(15),
          lineHeight: 5.0,
          percent: pillar.progress() * 0.01,
          backgroundColor: HexColor("${pillar.colorTheme}").withOpacity(0.2),
          progressColor: HexColor("${pillar.colorTheme}"),
        );

    Widget percentageText() => Text(
          "${pillar.progress()}%",
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        );

    Widget progressRatioText() => Text(
          "${pillar.completed!} / ${pillar.total}",
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        );

    return Card(
        clipBehavior: Clip.antiAlias,
        elevation: 2,
        child: InkWell(
          onTap: () => onTap(),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: LayoutBuilder(builder: (context, constraints) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon(constraints.maxWidth),
                  hSpaceRegular,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        title(),
                        const SizedBox(
                          height: 5,
                        ),
                        percentIndicator(),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            progressRatioText(),
                            percentageText(),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              );
            }),
          ),
        ));
  }
}
