import 'package:auto_route/auto_route.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ez_dashboard/ez_drawer_button.dart';
import 'package:wellness_hub_australia/features/badges/pages/view_badge_page.dart';
import 'package:wellness_hub_australia/app/core/authentication/pages/basic_profile_page.dart';
import 'package:wellness_hub_australia/features/settings/widgets/settings_ui.dart';
import 'package:flutter/material.dart';

class ClientProfilePage extends StatelessWidget {
  const ClientProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ezDrawerButton(context),
        automaticallyImplyLeading: false,
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SettingsList(sections: [
          SettingsSection(title: "MY ACCOUNT", tiles: [
            SettingsTile(
              icon: RoundedIcon(
                const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                background: Colors.blue.shade400,
              ),
              title: "Basic Profile",
              onTap: () {
                context.router.root.pushWidget(
                  const BasicProfilePage(),
                );
              },
            ),
            SettingsTile(
              icon: RoundedIcon(
                const Icon(
                  EvaIcons.award,
                  color: Colors.white,
                ),
                background: Colors.orange.shade400,
              ),
              title: "Badges",
              onTap: () {
                context.router.root.pushWidget(
                  const BadgesPage(),
                );
              },
            ),
          ])
        ]),
      ),
    );
  }
}
