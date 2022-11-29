import 'package:auto_route/auto_route.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ez_core/ez_core.dart';
import 'package:ez_dashboard/ez_drawer_button.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:stacked/stacked.dart';
import 'package:wellness_hub_australia/app/app_view_model.dart';
import 'package:wellness_hub_australia/features/authentication/address_extension.dart';
import 'package:wellness_hub_australia/features/badges/pages/view_badge_page.dart';
import 'package:wellness_hub_australia/features/profile/basic_profile_page.dart';
import 'package:wellness_hub_australia/features/settings/widgets/settings_ui.dart';
import 'package:wellness_hub_australia/app/shared/ui/scaffold_body_wrapper.dart';
import 'package:flutter/material.dart';

class _Profile extends ViewModelWidget<AppViewModel> {
  @override
  Widget build(BuildContext context, AppViewModel viewModel) {
    Widget name() {
      return Text(
        "${viewModel.user?.firstName} ${viewModel.user?.lastName}",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      );
    }

    Widget address() {
      return Text(
        "${viewModel.user?.address?.displaySafe()}",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 14,
        ),
      );
    }

    return Stack(children: [
      Padding(
        padding: const EdgeInsets.only(top: 60),
        child: SizedBox(
          width: double.infinity,
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: SizedBox(
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  name(),
                  vSpaceTiny,
                  address(),
                  vSpaceRegular,
                ],
              ),
            ),
          ),
        ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: EzAvatar(
          firstName: "${viewModel.user?.firstName} ${viewModel.user?.lastName}",
          imgUrl: "${viewModel.user?.profilePic}",
        ),
      ),
    ]);
  }
}

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
        body: ScaffoldBodyWrapper(
            onRefresh: () async {},
            builder: (context, constraints) {
              return Column(
                children: [
                  _Profile(),
                  vSpaceRegular,
                  SettingsList(sections: [
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
                ],
              );
            }));
  }
}
