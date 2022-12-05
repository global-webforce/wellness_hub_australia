import 'package:auto_route/auto_route.dart';
import 'package:easy_debounce/easy_debounce.dart';
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

    return Wrap(
      children: [
        BottomNavigationBar(
          currentIndex: activeIndex,
          items: items
              .map((e) =>
                  BottomNavigationBarItem(icon: Icon(e.icon), label: e.title))
              .toList(),
          unselectedItemColor: Theme.of(context).disabledColor,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          onTap: (i) {
            EasyDebounce.debounce(
                'bottom-navigate', // <-- An ID for this particular debouncer
                const Duration(milliseconds: 100), // <-- The debounce duration
                () {
              context.replaceRoute(items[i].route);
            } // <-- The target method
                );
          },
        ),
      ],
    );
  }
}

class EZBottomNavbarItem {
  final String title;
  final IconData icon;
  final PageRouteInfo route;

  EZBottomNavbarItem({
    required this.title,
    required this.icon,
    required this.route,
  });
}
