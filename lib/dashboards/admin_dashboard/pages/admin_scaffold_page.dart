import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ez_dashboard/ez_dashboard.dart';
import 'package:wellness_hub_australia/app/app_view_model.dart';
import 'package:wellness_hub_australia/app/routes/app_router.gr.dart';
import 'package:wellness_hub_australia/dashboards/admin_dashboard/viewmodels/admin_scaffold_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class AdminScaffoldPage extends StatelessWidget {
  const AdminScaffoldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdminScaffoldPageViewModel>.reactive(
        viewModelBuilder: () => AdminScaffoldPageViewModel(),
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
                route: const CompaniesRoute(),
              ),
              EzMenu(
                title: 'Notifications',
                prefixPath: 'notifications',
                icon: Icons.notifications,
                route: const PushNotificationsRoute(),
              ),
              EzMenu(
                title: 'Profile',
                prefixPath: 'profile',
                icon: EvaIcons.person,
                route: const BasicProfileRoute(),
              ),
              EzMenu(
                  title: 'Settings',
                  prefixPath: 'settings',
                  icon: EvaIcons.settings,
                  route: const AdminSettingsRoute()),
            ],
            bottomBarMenus: [
              EzMenu(
                title: 'Home',
                prefixPath: 'home',
                icon: EvaIcons.home,
                route: const CompaniesRoute(),
              ),
              EzMenu(
                title: 'Profile',
                prefixPath: 'profile',
                icon: EvaIcons.activity,
                route: const BasicProfileRoute(),
              ),
              EzMenu(
                title: 'Settings',
                prefixPath: 'settings',
                icon: EvaIcons.settings,
                route: const AdminSettingsRoute(),
              ),
            ],
          );
        });
  }
}
