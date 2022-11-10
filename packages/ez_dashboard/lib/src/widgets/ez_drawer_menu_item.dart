import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart';
import 'package:ez_dashboard/src/widgets/ez_menu.dart';
import 'package:flutter/material.dart';

class EzMenuItem extends StatelessWidget {
  final EzMenu ezMenu;
  const EzMenuItem({Key? key, required this.ezMenu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ezMenu.isActive
          ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
          : Colors.transparent,
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      child: ListTile(
        leading: Icon(
          ezMenu.icon,
          color: ezMenu.isActive ? Theme.of(context).colorScheme.primary : null,
        ),
        trailing: Badge(
            padding: EdgeInsets.all(8),
            toAnimate: false,
            shape: BadgeShape.circle,
            badgeColor: Colors.red,
            showBadge: ezMenu.notificationCount > 0,
            badgeContent: Text(
              ezMenu.notificationCount.toString(),
              style: TextStyle(color: Colors.white),
            )),
        tileColor: Colors.transparent,
        title: Text(
          ezMenu.title,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: ezMenu.isActive
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey),
        ),
        onTap: () {
          // context.router.navigate(ezMenu.route);

          context.router.replace(ezMenu.route);
        },
      ),
    );
  }
}
