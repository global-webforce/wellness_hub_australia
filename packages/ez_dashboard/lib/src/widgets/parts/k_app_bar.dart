import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart';
import 'package:ez_core/ez_core.dart';
import 'package:ez_dashboard/src/widgets/ez_menu.dart';
import 'package:flutter/material.dart';

class KAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<EzMenu> menus;
  final bool automaticallyImplyLeading;
  KAppBar(
      {Key? key, this.automaticallyImplyLeading = true, this.menus = const []})
      : super(key: key);

  @override
  PreferredSizeWidget build(BuildContext context) {
    //print("KAppBar Rebuild!");

    return AppBar(
        elevation: 1,
        automaticallyImplyLeading: automaticallyImplyLeading,
        leading: !automaticallyImplyLeading
            ? null
            : IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
        actions: [
          ...menus
              .map((e) => IconButton(
                  tooltip: e.title,
                  onPressed: () {
                    context.router.navigate(e.route);
                  },
                  icon: Badge(
                      toAnimate: false,
                      showBadge: e.notificationCount > 0,
                      badgeColor: Colors.red,
                      badgeContent: Text(e.notificationCount.toString(),
                          style: TextStyle(color: Colors.white)),
                      child: Icon(e.icon))))
              .toList(),
          hSpaceSmall,
        ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
