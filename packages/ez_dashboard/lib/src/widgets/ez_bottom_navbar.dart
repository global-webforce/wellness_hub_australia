import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class EZBottomNavbar extends StatelessWidget {
  final List<EZBottomNavbarItem> items;
  const EZBottomNavbar({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final autoRouter = AutoRouter.of(context);

    var activeIndex = items.indexWhere(
      (r) => autoRouter.isRouteActive(r.route.routeName),
    );

    if (activeIndex == -1) {
      activeIndex = 0;
    }

    return BottomNavigationBar(
      currentIndex: activeIndex,
      items: items
          .map((e) => BottomNavigationBarItem(icon: e.icon, label: e.title))
          .toList(),
      unselectedItemColor: Theme.of(context).disabledColor,
      selectedItemColor: Theme.of(context).primaryColor,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      onTap: (i) {
        context.replaceRoute(items[i].route);
      },
    );
  }
}

class EZBottomNavbarItem {
  final String title;
  final Widget icon;
  final PageRouteInfo route;

  EZBottomNavbarItem({
    required this.title,
    required this.icon,
    required this.route,
  });
}
