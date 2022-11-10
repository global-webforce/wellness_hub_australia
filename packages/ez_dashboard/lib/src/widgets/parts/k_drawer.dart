import 'package:ez_core/ez_core.dart';
import 'package:ez_dashboard/src/widgets/ez_menu.dart';
import 'package:ez_dashboard/src/widgets/ez_drawer_menu_item.dart';
import 'package:flutter/material.dart';

class KDrawer extends StatelessWidget {
  final String appName;
  final Widget userAccountDrawer;
  final List<EzMenu> routes;
  final String currentRoute;

  KDrawer({
    Key? key,
    this.currentRoute = "/",
    required this.routes,
    this.appName = "[ App Name ]",
    this.userAccountDrawer = const SizedBox.shrink(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print("KDrawer Rebuild!");

    Widget _appLogo = Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Image.asset(
        "assets/images/logo_basic.png",
        color: Colors.white,
        fit: BoxFit.contain,
        width: 30,
        errorBuilder: (context, obj, _) {
          return Icon(Icons.image_rounded);
        },
      ),
    );

    Widget _appTitle = Text(
      appName,
      style: TextStyle(
          height: 1.3,
          fontWeight: FontWeight.w500,
          fontSize: 18,
          overflow: TextOverflow.ellipsis),
    );

    Widget _buildAppBar() {
      return AppBar(
          //  backgroundColor: Theme.of(context).appBarTheme.backgroundColor,

          automaticallyImplyLeading: false,
          title: Row(
            children: [_appLogo, Expanded(child: _appTitle)],
          ));
    }

    return Drawer(
        elevation: 2,
        child: LayoutBuilder(builder: (context, constraint) {
          return Column(
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    _buildAppBar(),
                    /*   Divider(
                      color: Colors.white.withOpacity(0.2),
                      height: 0,
                      thickness: 1,
                    ), */
                    userAccountDrawer,
                    Padding(
                      padding: xSpaceRegular,
                      child: Column(
                        children: routes.map((e) {
                          return (e.prefixPath == currentRoute)
                              ? EzMenuItem(ezMenu: e.copyWith(isActive: true))
                              : EzMenuItem(ezMenu: e);
                        }).toList(),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }));
  }
}
