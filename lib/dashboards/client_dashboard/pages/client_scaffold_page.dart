import 'package:auto_route/auto_route.dart';
import 'package:ez_dashboard/ez_dashboard.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wellness_hub_australia/app/app_view_model.dart';
import 'package:wellness_hub_australia/app/routes/app_router.gr.dart';

class DrawerHeader extends ViewModelWidget<AppViewModel> {
  const DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, AppViewModel viewModel) {
    return EZDrawerHeader(
      currentAccountPicture: EzAvatar(
        imgUrl: "${viewModel.user?.profilePic}",
        name: "${viewModel.user?.firstName} ${viewModel.user?.lastName}",
        radius: 40,
      ),
      userEmail: "${viewModel.user?.email}",
      userName: "${viewModel.user?.firstName} ${viewModel.user?.lastName}",
    );
  }
}

class ClientScaffoldPage extends StatelessWidget {
  const ClientScaffoldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
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

    return WillPopScope(
        onWillPop: showExitPopup,
        child: AutoRouter(
            key: const Key("111111"),
            builder: (context, content) {
              final kContent = KeyedSubtree(
                key: const GlobalObjectKey('client-scaffold'),
                child: content,
              );
              return EZDashboard(
                mainContent: kContent,
                scaffoldKey:
                    getParentViewModel<AppViewModel>(context, listen: false)
                        .scaffoldkey,
                drawer: EZDrawer(
                  scaffoldKey:
                      getParentViewModel<AppViewModel>(context, listen: false)
                          .scaffoldkey,
                  appBar: EZAppBar(
                      leadingImageAsset: "assets/images/logo_basic.png",
                      appName: const Text(
                        "Wellness Hub Australia",
                        style: TextStyle(fontSize: 18),
                      )),
                  drawerHeader: const DrawerHeader(),
                  items: [
                    EZDrawerMenuItem(
                      icon: Icons.home_rounded,
                      title: "HOME",
                      route: const ClientHomeRoute(),
                    ),
                    EZDrawerMenuItem(
                      icon: Icons.calendar_month_rounded,
                      title: "APPOINTMENTS",
                      route: const AppointmentsRoute(),
                    ),
                    EZDrawerMenuItem(
                      icon: Icons.chat,
                      title: "CHATS",
                      route: const ChatsRoute(),
                    ),
                    EZDrawerMenuItem(
                      icon: Icons.notifications_rounded,
                      title: "NOTIFICATIONS",
                      route: const PushNotificationsRoute(),
                    ),
                    EZDrawerMenuItem(
                      icon: Icons.person_rounded,
                      title: "PROFILE",
                      route: const ClientProfileRoute(),
                    ),
                    EZDrawerMenuItem(
                      icon: Icons.settings_rounded,
                      title: "SETTINGS",
                      route: const ClientSettingsRoute(),
                    ),
                  ],
                ),
                bottomNavBar: EZBottomNavbar(
                  items: [
                    EZBottomNavbarItem(
                      icon: Icons.home_rounded,
                      title: "HOME",
                      route: const ClientHomeRoute(),
                    ),
                    EZBottomNavbarItem(
                      icon: Icons.calendar_month_rounded,
                      title: "APPOINTMENTS",
                      route: const AppointmentsRoute(),
                    ),
                    EZBottomNavbarItem(
                      icon: Icons.chat_rounded,
                      title: "CHATS",
                      route: const ChatsRoute(),
                    ),
                    EZBottomNavbarItem(
                      icon: Icons.notifications_rounded,
                      title: "NOTIFICATIONS",
                      route: const PushNotificationsRoute(),
                    ),
                  ],
                ),
              );
            }));
  }
}
