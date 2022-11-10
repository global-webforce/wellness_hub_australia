import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ez_dashboard/ez_dashboard.dart';
import 'package:wellness_hub_australia/app/app_view_model.dart';
import 'package:wellness_hub_australia/app/routes/app_router.gr.dart';
import 'package:wellness_hub_australia/dashboards/client_dashboard/viewmodels/client_scaffold_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class ClientScaffoldPage extends StatelessWidget {
  const ClientScaffoldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ClientScaffoldPageViewModel>.reactive(
        viewModelBuilder: () => ClientScaffoldPageViewModel(),
        builder: (context, viewModel, child) {
          return EzDashboard(
            appName: "Wellness Hub Australia ",
            userAccountDrawer:
                Consumer<AppViewModel>(builder: (context, auth, child) {
              return EzUserAccountsDrawerHeader(
                  imgUrl: "${auth.user?.profilePic}",
                  fullName:
                      "${auth.user?.firstName} ${auth.user?.lastName}  #${auth.user?.id}",
                  email: "${auth.user?.email}",
                  bgColor: Theme.of(context).colorScheme.primary);
            }),
            drawerMenus: [
              EzMenu(
                title: 'Home',
                prefixPath: 'home',
                icon: EvaIcons.home,
                route: const ClientHomeRoute(),
              ),
              EzMenu(
                title: 'Appointments',
                prefixPath: 'appointments',
                icon: EvaIcons.bookmark,
                route: const AppointmentsRoute(),
              ),
              EzMenu(
                title: 'Chat',
                prefixPath: 'chat',
                icon: Icons.chat_bubble,
                route: const ChatsRoute(),
              ),
              EzMenu(
                title: 'Notifications',
                prefixPath: 'notifications',
                icon: Icons.notifications,
                route: const PushNotificationsRoute(),
              ),
              EzMenu(
                title: 'Profile',
                prefixPath: 'clientProfile',
                icon: EvaIcons.person,
                route: const ClientProfileRoute(),
              ),
              EzMenu(
                title: 'Settings',
                prefixPath: 'settings',
                icon: EvaIcons.settings,
                route: const ClientSettingsRoute(),
              ),
            ],
            bottomBarMenus: [
              EzMenu(
                title: 'Home',
                prefixPath: 'home',
                icon: EvaIcons.home,
                route: const ClientHomeRoute(),
              ),
              EzMenu(
                title: 'Appointments',
                prefixPath: 'appointments',
                icon: EvaIcons.heart,
                route: const AppointmentsRoute(),
              ),
              EzMenu(
                title: 'Profile',
                prefixPath: 'clientProfile',
                icon: EvaIcons.activity,
                route: const ClientProfileRoute(),
              ),
              EzMenu(
                title: 'Settings',
                prefixPath: 'settings',
                icon: EvaIcons.settings,
                route: const ClientSettingsRoute(),
              ),
            ],
          );
        });
  }
}
