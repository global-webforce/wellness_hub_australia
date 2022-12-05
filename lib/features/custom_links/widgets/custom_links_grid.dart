import 'package:ez_dashboard/screen_size_helper.dart';
import 'package:wellness_hub_australia/features/custom_links/widgets/custom_links_card.dart';
import 'package:wellness_hub_australia/app/models/custom_link.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomLinksGrid extends StatelessWidget {
  final List<CustomLink> customLinks;
  const CustomLinksGrid({Key? key, required this.customLinks})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: isMobile(context) ? null : 357,
        child: AlignedGridView.count(
            shrinkWrap: true,
            primary: false,
            physics: const BouncingScrollPhysics(),
            scrollDirection:
                isMobile(context) ? Axis.vertical : Axis.horizontal,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: isMobile(context) ? 2 : 1,
            itemCount: customLinks.length,
            itemBuilder: (ctx, i) {
              return CustomLinksCard(
                  customLink: customLinks[i],
                  onTap: () async {
                    await launchUrl(
                      Uri.parse("${customLinks[i].url}"),
                      mode: LaunchMode.platformDefault,
                    );
                  });
            }));
  }
}
