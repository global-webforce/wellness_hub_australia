import 'package:cached_network_image/cached_network_image.dart';
import 'package:ez_core/ez_core.dart';
import 'package:wellness_hub_australia/app/models/pillar.model.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class PillarCard extends StatelessWidget {
  final Pillar pillar;
  final bool selected;
  final Function onTap;
  const PillarCard(
      {Key? key,
      required this.pillar,
      required this.onTap,
      this.selected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget image(double width) {
      return CachedNetworkImage(
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
      );
    }

    Widget title() {
      return Text(
        "${pillar.title}".toUpperCase(),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            height: 1.3,
            fontWeight: FontWeight.w600),
      );
    }

    return Card(
        color: HexColor("${pillar.colorTheme}"),
        clipBehavior: Clip.antiAlias,
        elevation: selected ? 10 : 1,
        child: InkWell(
          onTap: () => onTap(),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: LayoutBuilder(builder: (context, constraints) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  image(constraints.maxWidth),
                  hSpaceRegular,
                  Expanded(
                    child: title(),
                  ),
                  if (selected)
                    const Icon(
                      Icons.check,
                      color: Colors.white,
                    )
                ],
              );
            }),
          ),
        ));
  }
}
