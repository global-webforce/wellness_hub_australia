import 'package:ez_dashboard/ez_dashboard.dart';
import 'package:wellness_hub_australia/app/app_view_model.dart';
import 'package:wellness_hub_australia/features/settings/widgets/settings_ui.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClientSettingsPage extends StatefulWidget {
  const ClientSettingsPage({Key? key}) : super(key: key);

  @override
  State<ClientSettingsPage> createState() => _ClientSettingsPageState();
}

class _ClientSettingsPageState extends State<ClientSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: ezDrawerButton(context),
          automaticallyImplyLeading: false,
          title: const Text("Settings"),
          actions: [
            IconButton(
                tooltip: "Change Theme",
                icon: const Icon(Icons.light_mode),
                onPressed: () {
                  Provider.of<AppViewModel>(context, listen: false)
                      .toggleDarkLightTheme();
                })
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SettingsList(sections: [
/*             SettingsSection(title: "NOTIFICATIONS", tiles: [
              SettingsTile.switchTile(
                icon: RoundedIcon(
                  const Icon(
                    EvaIcons.bell,
                    color: Colors.white,
                  ),
                  background: Theme.of(context).primaryColor,
                ),
                title: "Tasks",
                value: true,
                onChanged: (value) {},
              ),
              SettingsTile.switchTile(
                icon: RoundedIcon(
                  const Icon(
                    EvaIcons.bell,
                    color: Colors.white,
                  ),
                  background: Theme.of(context).primaryColor,
                ),
                title: "Bookings",
                value: true,
                onChanged: (value) {},
              ),
              SettingsTile.switchTile(
                icon: RoundedIcon(
                  const Icon(
                    EvaIcons.bell,
                    color: Colors.white,
                  ),
                  background: Theme.of(context).primaryColor,
                ),
                title: "Badges",
                value: true,
                onChanged: (value) {},
              ),
            ]), */
            SettingsSection(title: "SESSION", tiles: [
              SettingsTile(
                icon: RoundedIcon(
                  const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  background: Colors.red.shade400,
                ),
                title: "Logout",
                onTap: () async {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  await Provider.of<AppViewModel>(context, listen: false)
                      .signOut();
                },
              )
            ])
          ]),
        ));
  }
}
