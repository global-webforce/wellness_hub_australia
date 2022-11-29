import 'package:auto_route/auto_route.dart';
import 'package:ez_dashboard/ez_dashboard.dart';
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
      userNetworkImage: "${viewModel.user?.profilePic}",
      userEmail: "${viewModel.user?.email}",
      userName:
          "${viewModel.user?.firstName} ${viewModel.user?.lastName}  #${viewModel.user?.id}",
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
      child: AutoRouter(builder: (context, content) {
        final kContent = KeyedSubtree(
          key: const GlobalObjectKey(2),
          child: content,
        );
        return EZDashboard(
          mainContent: kContent,
          scaffoldKey: getParentViewModel<AppViewModel>(context, listen: false)
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
                icon: const Icon(Icons.home_rounded),
                title: "HOME",
                route: const ClientHomeRoute(),
              ),
              EZDrawerMenuItem(
                icon: const Icon(Icons.calendar_month_rounded),
                title: "APPOINTMENTS",
                route: const AppointmentsRoute(),
              ),
              EZDrawerMenuItem(
                icon: const Icon(Icons.chat_rounded),
                title: "CHAT",
                route: const ChatsRoute(),
              ),
              EZDrawerMenuItem(
                icon: const Icon(Icons.notifications_rounded),
                title: "NOTIFICATIONS",
                route: const PushNotificationsRoute(),
              ),
              EZDrawerMenuItem(
                icon: const Icon(Icons.person_rounded),
                title: "PROFILE",
                route: const ClientProfileRoute(),
              ),
              EZDrawerMenuItem(
                icon: const Icon(Icons.settings_rounded),
                title: "SETTINGS",
                route: const ClientSettingsRoute(),
              ),
            ],
          ),
          bottomNavBar: EZBottomNavbar(
            items: [
              EZBottomNavbarItem(
                icon: const Icon(Icons.home_rounded),
                title: "HOME",
                route: const ClientHomeRoute(),
              ),
              EZBottomNavbarItem(
                icon: const Icon(Icons.calendar_month_rounded),
                title: "APPOINTMENTS",
                route: const AppointmentsRoute(),
              ),
              EZBottomNavbarItem(
                icon: const Icon(Icons.person_rounded),
                title: "PROFILE",
                route: const ClientProfileRoute(),
              ),
              EZBottomNavbarItem(
                icon: const Icon(Icons.settings_rounded),
                title: "SETTINGS",
                route: const ClientSettingsRoute(),
              ),
            ],
          ),
        );
      }),
    );
  }
}
