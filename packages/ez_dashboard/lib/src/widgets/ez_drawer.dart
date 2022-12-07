import 'package:auto_route/auto_route.dart';
import 'package:easy_debounce/easy_debounce.dart';

import 'package:ez_dashboard/src/widgets/ez_appbar.dart';
import 'package:flutter/material.dart';

class EZDrawerMenuItem {
  final String title;
  final IconData icon;
  final int notificationCount;
  final PageRouteInfo route;

  EZDrawerMenuItem({
    required this.title,
    required this.icon,
    required this.route,
    this.notificationCount = 0,
  });
}

//DRAWER HERE!!!
class EZDrawer extends StatefulWidget {
  final Widget? drawerHeader;
  final EZAppBar appBar;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final List<EZDrawerMenuItem> items;
  final int currentIndex;
  const EZDrawer(
      {Key? key,
      this.drawerHeader,
      required this.items,
      required this.scaffoldKey,
      this.currentIndex = 0,
      required this.appBar})
      : super(key: key);

  @override
  State<EZDrawer> createState() => _EZDrawerState();
}

class _EZDrawerState extends State<EZDrawer> {
  List<Widget> items = [];

  @override
  void didChangeDependencies() {
    final autoRouter = AutoRouter.of(context, watch: true);
    items = widget.items.map((menu) {
      return Card(
        elevation: 0,
        clipBehavior: Clip.hardEdge,
        color: autoRouter.isRouteActive(menu.route.routeName)
            ? Theme.of(context).primaryColorLight
            : Colors.transparent,
        child: ListTile(
          leading: Icon(
            menu.icon,
            color: autoRouter.isRouteActive(menu.route.routeName)
                ? Theme.of(context).primaryColor
                : null,
          ),
          title: Text(
            menu.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          onTap: () {
            EasyDebounce.debounce(
                'bottom-navigation', const Duration(milliseconds: 100), () {
              context.replaceRoute(menu.route);
              widget.scaffoldKey.currentState!.closeDrawer();
            });
          },
          trailing: (menu.notificationCount > 0)
              ? CircleAvatar(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  radius: 15,
                  child: Text(
                    "${menu.notificationCount}",
                  ),
                )
              : const SizedBox.shrink(),
        ),
      );
    }).toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ClipRRect(
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                color: Theme.of(context).disabledColor.withOpacity(0.2),
                width: 1.0,
              ),
            ),
          ),
          child: Drawer(
            elevation: 0,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                widget.appBar,
                widget.drawerHeader ?? const SizedBox.shrink(),
                ListView(
                    padding: const EdgeInsets.all(10),
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    children: items)
              ],
            ),
          ),
        ),
      );
    });
  }
}
