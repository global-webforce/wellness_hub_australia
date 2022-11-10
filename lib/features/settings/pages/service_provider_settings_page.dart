import 'package:ez_ui/ez_ui.dart';
import 'package:wellness_hub_australia/app/app_view_model.dart';
import 'package:wellness_hub_australia/features/settings/widgets/settings_ui.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServiceProviderSettingsPage extends StatefulWidget {
  const ServiceProviderSettingsPage({Key? key}) : super(key: key);

  @override
  State<ServiceProviderSettingsPage> createState() =>
      _ServiceProviderSettingsPageState();
}

class _ServiceProviderSettingsPageState
    extends State<ServiceProviderSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: ezDrawerToggle(context),
          title: const Text("Settings"),
          automaticallyImplyLeading: false,
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
                  await Provider.of<AppViewModel>(context, listen: false)
                      .signOut();
                },
              )
            ])
          ]),
        ));
  }
}