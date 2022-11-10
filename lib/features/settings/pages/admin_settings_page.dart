import 'package:ez_ui/ez_ui.dart';
import 'package:wellness_hub_australia/app/app_view_model.dart';
import 'package:wellness_hub_australia/features/settings/widgets/settings_ui.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:theme_provider/theme_provider.dart';

class AdminSettingsPage extends StatefulWidget {
  const AdminSettingsPage({Key? key}) : super(key: key);

  @override
  State<AdminSettingsPage> createState() => _AdminSettingsPageState();
}

class _AdminSettingsPageState extends State<AdminSettingsPage> {
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
                icon: Icon(
                    ThemeProvider.controllerOf(context).currentThemeId == 'dark'
                        ? Icons.dark_mode
                        : Icons.light_mode),
                onPressed: () {
                  ThemeProvider.controllerOf(context).currentThemeId == 'dark'
                      ? ThemeProvider.controllerOf(context).setTheme('ezo')
                      : ThemeProvider.controllerOf(context).setTheme('dark');
                }),
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
