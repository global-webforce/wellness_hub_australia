import 'package:ez_dashboard/src/widgets/ez_appbar.dart';
import 'package:ez_dashboard/src/widgets/ez_bottom_navbar.dart';
import 'package:ez_dashboard/src/widgets/ez_drawer.dart';
import 'package:flutter/material.dart';

class EZDashboard extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final EZAppBar appBar;
  final EZDrawer drawer;
  final Widget mainContent;
  final EZBottomNavbar bottomNavBar;
  const EZDashboard(
      {Key? key,
      required this.appBar,
      required this.scaffoldKey,
      required this.drawer,
      required this.bottomNavBar,
      required this.mainContent})
      : super(key: key);

  @override
  State<EZDashboard> createState() => _EZDashboardState();
}

class _EZDashboardState extends State<EZDashboard> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.scaffoldKey.currentState!.isDrawerOpen) {
        widget.scaffoldKey.currentState!.closeDrawer();
      }
      if (MediaQuery.of(context).size.width > 1062) {
        widget.scaffoldKey.currentState!.closeDrawer();
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: widget.scaffoldKey,
        drawer: widget.drawer,
        appBar: widget.appBar,
        drawerEnableOpenDragGesture: true,
        bottomNavigationBar: !(MediaQuery.of(context).size.width > 1062)
            ? widget.bottomNavBar
            : null,
        body: Row(
          children: [
            if (MediaQuery.of(context).size.width > 1062) widget.drawer,
            Expanded(child: widget.mainContent),
          ],
        ));
  }
}
