import 'package:ez_dashboard/screen_size_helper.dart';
import 'package:wellness_hub_australia/app/shared/ui/sliver_grid_delegate.dart';
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
    return LayoutBuilder(builder: (context, constraint) {
      return SizedBox(
          width: double.infinity,
          height: isMobile(context) ? null : 357,
          child: GridView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: customLinks.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                crossAxisCount: isMobile(context)
                    ? 2
                    : isTablet(context)
                        ? 3
                        : 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                height: 320,
              ), //48
              scrollDirection: Axis.vertical,
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
    });
  }
}
