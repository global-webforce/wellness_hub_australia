import 'package:auto_size_text/auto_size_text.dart';
import 'package:wellness_hub_australia/features/custom_links/widgets/custom_links_card.dart';
import 'package:wellness_hub_australia/app/models/custom_link.model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomLinksGrid extends StatelessWidget {
  final List<CustomLink> customLinks;
  const CustomLinksGrid({Key? key, required this.customLinks})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myGroup = AutoSizeGroup();

    return LayoutBuilder(builder: (context, constraint) {
      return SizedBox(
          width: double.infinity,
          height: 330,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              primary: false,
              physics: const BouncingScrollPhysics(),
              addRepaintBoundaries: false,
              addAutomaticKeepAlives: false,
              itemCount: customLinks.length,
              padding: const EdgeInsets.symmetric(vertical: 3),
              separatorBuilder: ((context, index) {
                return const SizedBox(
                  width: 10,
                );
              }),
              itemBuilder: (context, index) {
                return CustomLinksCard(
                    autoSizeGroup: myGroup,
                    customLink: customLinks[index],
                    onTap: () async {
                      await launchUrl(
                        Uri.parse("${customLinks[index].url}"),
                        mode: LaunchMode.platformDefault,
                      );
                    });
              }));
      //48
    });
  }
}
