import 'package:cached_network_image/cached_network_image.dart';
import 'package:ez_core/ez_core.dart';
import 'package:wellness_hub_australia/app/models/badge.model.dart';

import 'package:flutter/material.dart';

class BadgeCard extends StatelessWidget {
  final Badge badge;
  final Function onTap;

  const BadgeCard({
    Key? key,
    required this.badge,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget badgeIcon() {
      return CachedNetworkImage(
        imageUrl: "${badge.imgPath}",
        width: 100,
        height: 100,
        errorWidget: (context, url, error) {
          return const Center(
              child: CircleAvatar(
            maxRadius: 40,
            backgroundColor: Colors.grey,
          ));
        },
      );
    }

    Widget title() {
      return Text(
        "${badge.badgeName} ",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          height: 1.3,
        ),
      );
    }

    Widget description() {
      return Text(
        "${badge.description}",
        style: const TextStyle(
          fontSize: 14,
          height: 1.3,
        ),
      );
    }

    return SizedBox(
        width: 360,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () => onTap(),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: LayoutBuilder(builder: (context, constraints) {
                return IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [badgeIcon()],
                            ),
                            hSpaceRegular,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  title(),
                                  vSpaceTiny,
                                  description(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ));
  }
}
