import 'package:ez_dashboard/src/helpers/screen_size.dart';
import 'package:ez_dashboard/src/widgets/ez_bottom_navbar.dart';
import 'package:ez_dashboard/src/widgets/ez_drawer.dart';
import 'package:flutter/material.dart';

class EZDashboard extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  final EZDrawer drawer;
  final Widget mainContent;
  final EZBottomNavbar bottomNavBar;
  const EZDashboard(
      {Key? key,
      required this.scaffoldKey,
      required this.drawer,
      required this.bottomNavBar,
      required this.mainContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scaffoldKey.currentState!.isDrawerOpen) {
        scaffoldKey.currentState!.closeDrawer();
      }
      if (isDesktop(context)) scaffoldKey.currentState!.closeDrawer();
    });
    return Scaffold(
        key: scaffoldKey,
        drawer: drawer,
        drawerEnableOpenDragGesture: true,
        bottomNavigationBar:
            !(MediaQuery.of(context).size.width > 1062) ? bottomNavBar : null,
        body: Row(
          children: [
            if (isDesktop(context)) drawer,
            if (isDesktop(context))
              const VerticalDivider(
                width: 1,
                color: Colors.white70,
              ),
            Expanded(child: mainContent),
          ],
        ));
  }
}
