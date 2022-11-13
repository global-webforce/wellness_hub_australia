import 'package:ez_dashboard/src/widgets/ez_appbar_avatar.dart';
import 'package:ez_dashboard/src/widgets/ez_appbar_icon.dart';
import 'package:flutter/material.dart';

class EZAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  final String appName;
  final List<EZAppBarIcon> iconBadges;
  final EzAppBarAvatar? userAvatar;
  final String? leadingImageAsset;
  EZAppBar(
      {super.key,
      required this.appName,
      List<EZAppBarIcon>? iconBadges,
      this.userAvatar,
      this.leadingImageAsset})
      : iconBadges = iconBadges ?? [];

  @override
  Widget build(BuildContext context) {
    final List<Widget> actionButtons = [
      ...iconBadges,
      const SizedBox(width: 5),
      userAvatar ?? const SizedBox.shrink()
    ];
    return AppBar(
        automaticallyImplyLeading: !(MediaQuery.of(context).size.width > 1062),
        title: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            spacing: 10,
            children: [
              Image.asset("$leadingImageAsset", width: 30, color: Colors.white),
              Text(appName)
            ]),
        actions: actionButtons);
  }
}
