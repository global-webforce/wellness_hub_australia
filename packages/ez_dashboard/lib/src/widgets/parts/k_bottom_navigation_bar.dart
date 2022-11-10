import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart';
import 'package:ez_dashboard/src/widgets/ez_menu.dart';
import 'package:flutter/material.dart';

class KBottomBar extends StatelessWidget {
  final List<EzMenu> routes;
  final String currentRoute;
  KBottomBar({
    Key? key,
    required this.routes,
    required this.currentRoute,
  }) : super(key: key);

  int getIndex() {
    try {
      int index =
          routes.indexWhere((route) => route.prefixPath == currentRoute);
      index = (index < 0) ? 0 : index;
      return index;
    } catch (e) {
      print(e.toString());
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    //print("KBottomBar Rebuild!");
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: routes.map((e) {
        return BottomNavigationBarItem(
          tooltip: e.title,
          icon: Badge(
              toAnimate: false,
              badgeColor: Colors.red,
              showBadge: e.notificationCount > 0,
              badgeContent: Text(e.notificationCount.toString(),
                  style: TextStyle(color: Colors.white)),
              child: Icon(e.icon)),
          label: e.title,
        );
      }).toList(),
      currentIndex: getIndex(),
      onTap: (index) {
        context.router.navigate(routes[index].route);
      },
    );
  }
}
