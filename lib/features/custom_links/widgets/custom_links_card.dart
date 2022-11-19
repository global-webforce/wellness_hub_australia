import 'package:cached_network_image/cached_network_image.dart';
import 'package:wellness_hub_australia/models/custom_link.model.dart';
import 'package:flutter/material.dart';

class CustomLinksCard extends StatelessWidget {
  final CustomLink customLink;
  final Function onTap;
  const CustomLinksCard(
      {Key? key, required this.customLink, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget image() {
      return Container(
        color: Colors.white,
        child: CachedNetworkImage(
          imageUrl:
              "https://gwf-cors-anywhere.herokuapp.com/${customLink.linkIcon}",
          width: double.infinity,
          height: 136,
          fit: BoxFit.fitWidth,
          errorWidget: (context, url, error) {
            return Image.asset(
              "/images/placeholder.png",
              fit: BoxFit.cover,
            );
          },
        ),
      );
    }

/*     Widget companyName() {
      return Text(
        "${customLink.companyName} • ",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 13, height: 1.3),
      );
    }

    Widget date() {
      return Text(
        timeago.format(DateTime.parse("${customLink.createdAt}")),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 13, height: 1.3),
      );
    } */

    Widget title() {
      return Text(
        "${customLink.title}",
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, height: 1.3),
      );
    }

    Widget description() {
      return Text(
        "${customLink.description}",
        style: const TextStyle(
          fontSize: 14,
        ),
      );
    }

    return SizedBox(
      width: 256,
      child: IntrinsicHeight(
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () => onTap(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                image(),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      title(),
                      const SizedBox(height: 8),
                      description(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
