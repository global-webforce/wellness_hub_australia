import 'package:auto_route/auto_route.dart';
import 'package:ez_dashboard/src/widgets/ez_menu.dart';
import 'package:ez_dashboard/src/widgets/parts/k_drawer.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'parts/k_bottom_navigation_bar.dart';

class EzDashboard extends StatefulWidget {
  final String appName;
  final String logoImageurl;
  final List<EzMenu> drawerMenus;
  final List<EzMenu> bottomBarMenus;
  final List<EzMenu> appBarMenus;
  final Widget userAccountDrawer;
  EzDashboard({
    Key? key,
    this.drawerMenus = const [],
    this.bottomBarMenus = const [],
    this.appBarMenus = const [],
    this.userAccountDrawer = const SizedBox.shrink(),
    this.appName = "[Project Name]",
    this.logoImageurl = "",
  }) : super(key: key);

  @override
  State<EzDashboard> createState() => _EzDashboardState();
}

class _EzDashboardState extends State<EzDashboard> {
  var currentRoute = "";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() {
    //Prevent drawer toggle on Desktop
    if (MediaQuery.of(context).size.width > 1100) {
      _scaffoldKey.currentState?.isDrawerOpen ?? false
          ? _scaffoldKey.currentState?.openEndDrawer()
          : null;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    /*
    print("=======================================");
    print("AutoRouter Rebuild!");
    */

    /*
    Userful AutoRoute properties:
    print(AutoRouter.of(context).topMatch.meta['fullscreen'])
    print(AutoRouterDelegate.of(context).urlState.path);
    print(context.routeData.pathParams.rawMap);
    print(context.routeData.inheritedPathParams);
    */

    Future<bool> _showExitPopup() async {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Exit App'),
              content: const Text('Do you want to exit an App?'),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('No'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Yes'),
                ),
              ],
            ),
          ) ??
          false;
    }

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.

    return WillPopScope(
      onWillPop: _showExitPopup,
      child: AutoRouter(
        key: const GlobalObjectKey('main-router'),
        builder: (context, content) {
          final kContent = KeyedSubtree(
            key: const GlobalObjectKey('content-main'),
            child: content,
          );

          final blankContent = KeyedSubtree(
              key: const GlobalObjectKey('content-main'),
              child: Scaffold(
                backgroundColor: Colors.black,
                body: const Center(
                  child: Text(
                    "Screen size not Supported.",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ));

          currentRoute =
              "${AutoRouter.of(context, watch: false).topMatch.meta['prefixPath']}";
          Widget drawer() {
            return KDrawer(
              appName: widget.appName,
              userAccountDrawer: widget.userAccountDrawer,
              routes: widget.drawerMenus,
              currentRoute: currentRoute,
            );
          }

          Widget? bottomNavigationBar() {
            return widget.bottomBarMenus.isNotEmpty
                ? KBottomBar(
                    currentRoute: currentRoute,
                    routes: widget.bottomBarMenus,
                  )
                : null;
          }

          return ScreenTypeLayout.builder(
            mobile: (BuildContext context) {
              return Scaffold(
                //appBar: appBar(),
                drawer: drawer(),
                body: kContent,
                bottomNavigationBar: bottomNavigationBar(),
              );
            },
            tablet: (BuildContext context) {
              return Scaffold(
                //appBar: appBar(),
                drawer: drawer(),
                body: kContent,
                bottomNavigationBar: bottomNavigationBar(),
              );
            },
            desktop: (BuildContext context) {
              return Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 304),
                    child: Scaffold(
                      //appBar: appBar(),
                      drawer: drawer(),
                      drawerEnableOpenDragGesture: false,
                      onDrawerChanged: (val) {
                        Navigator.of(context).pop();
                      },
                      body: kContent,
                    ),
                  ),
                  drawer(),
                ],
              );
            },
            watch: (BuildContext context) {
              return blankContent;
            },
          );
        },
      ),
    );
  }
}
