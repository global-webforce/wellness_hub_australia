import 'package:auto_route/auto_route.dart';
import 'package:ez_dashboard/ez_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellness_hub_australia/app/app_view_model.dart';
import 'package:wellness_hub_australia/app/routes/app_router.gr.dart';

class ServiceProviderScaffoldPage extends StatelessWidget {
  const ServiceProviderScaffoldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
    return AutoRouter(
        key: const GlobalObjectKey(1),
        builder: (context, content) {
          final kContent = KeyedSubtree(
            key: const GlobalObjectKey(2),
            child: content,
          );
          return EZDashboard(
            mainContent: kContent,
            appBar: EZAppBar(
              leadingImageAsset: "assets/images/logo_basic.png",
              appName: "WELLNESS HUB AUSTRALIA",
            ),
            scaffoldKey: scaffoldkey,
            drawer: EZDrawer(
              scaffoldKey: scaffoldkey,
              drawerHeader:
                  Consumer<AppViewModel>(builder: (context, auth, child) {
                return EZDrawerHeader(
                  userNetworkImage: "${auth.user?.profilePic}",
                  userEmail: "${auth.user?.email}",
                  userName:
                      "${auth.user?.firstName} ${auth.user?.lastName}  #${auth.user?.id}",
                );
              }),
              items: [
                EZDrawerMenuItem(
                  icon: const Icon(Icons.home_rounded),
                  title: "HOME",
                  route: const ServiceProviderHomeRoute(),
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
                  route: const ServiceProviderProfileRoute(),
                ),
                EZDrawerMenuItem(
                  icon: const Icon(Icons.settings_rounded),
                  title: "SETTINGS",
                  route: const ServiceProviderSettingsRoute(),
                ),
              ],
            ),
            bottomNavBar: EZBottomNavbar(
              items: [
                EZBottomNavbarItem(
                  icon: const Icon(Icons.home_rounded),
                  title: "HOME",
                  route: const ServiceProviderHomeRoute(),
                ),
                EZBottomNavbarItem(
                  icon: const Icon(Icons.calendar_month_rounded),
                  title: "APPOINTMENTS",
                  route: const AppointmentsRoute(),
                ),
                EZBottomNavbarItem(
                  icon: const Icon(Icons.person_rounded),
                  title: "PROFILE",
                  route: const ServiceProviderProfileRoute(),
                ),
                EZBottomNavbarItem(
                  icon: const Icon(Icons.settings_rounded),
                  title: "SETTINGS",
                  route: const ServiceProviderSettingsRoute(),
                ),
              ],
            ),
          );
        });
  }
}
