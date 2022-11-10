import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ez_dashboard/ez_dashboard.dart';
import 'package:wellness_hub_australia/app/app_view_model.dart';
import 'package:wellness_hub_australia/app/routes/app_router.gr.dart';
import 'package:wellness_hub_australia/dashboards/service_provider_dashboard/viewmodels/service_provider_scaffold_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class ServiceProviderScaffoldPage extends StatelessWidget {
  const ServiceProviderScaffoldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ServiceProviderScaffoldPageViewModel>.reactive(
        viewModelBuilder: () => ServiceProviderScaffoldPageViewModel(),
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
                route: const ServiceProviderHomeRoute(),
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
                prefixPath: 'spProfile',
                icon: EvaIcons.person,
                route: const ServiceProviderProfileRoute(),
              ),
              EzMenu(
                  title: 'Settings',
                  prefixPath: 'settings',
                  icon: EvaIcons.settings,
                  route: const ServiceProviderSettingsRoute()),
            ],
            bottomBarMenus: [
              EzMenu(
                title: 'Home',
                prefixPath: 'home',
                icon: EvaIcons.home,
                route: const ServiceProviderHomeRoute(),
              ),
              EzMenu(
                title: 'Appointments',
                prefixPath: 'appointments',
                icon: EvaIcons.bookmark,
                route: const AppointmentsRoute(),
              ),
              EzMenu(
                title: 'Profile',
                prefixPath: 'spProfile',
                icon: EvaIcons.activity,
                route: const ServiceProviderProfileRoute(),
              ),
              EzMenu(
                title: 'Settings',
                prefixPath: 'settings',
                icon: EvaIcons.settings,
                route: const ServiceProviderSettingsRoute(),
              ),
            ],
          );
        });
  }
}
