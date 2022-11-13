import 'package:auto_route/auto_route.dart';
import 'package:ez_core/ez_core.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:wellness_hub_australia/app/app_view_model.dart';
import 'package:wellness_hub_australia/features/authentication/address_extension.dart';
import 'package:wellness_hub_australia/features/credentials/pages/view_credentials_page.dart';
import 'package:wellness_hub_australia/features/offered_services/pages/view_offered_services_page.dart';
import 'package:wellness_hub_australia/features/profile/basic_profile_page.dart';

import 'package:wellness_hub_australia/features/service_schedules/pages/service_schedules_page.dart';
import 'package:wellness_hub_australia/features/settings/widgets/settings_ui.dart';
import 'package:wellness_hub_australia/app/shared/ui/scaffold_body_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServiceProviderProfilePage extends StatelessWidget {
  const ServiceProviderProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Profile"),
        ),
        body: ScaffoldBodyWrapper(
            onRefresh: () async {},
            builder: (context, constraints) {
              return Column(
                children: [
                  Consumer<AppViewModel>(builder: (context, auth, child) {
                    Widget name() {
                      return Text(
                        "${auth.user?.firstName} ${auth.user?.lastName}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      );
                    }

                    Widget address() {
                      return Text(
                        "${auth.user?.address?.displaySafe()}",
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
                          firstName:
                              "${auth.user?.firstName} ${auth.user?.lastName}",
                          imgUrl: "${auth.user?.profilePic}",
                        ),
                      ),
                    ]);
                  }),
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
                              transitionBuilder: TransitionsBuilders.fadeIn);
                        },
                      ),
                    ])
                  ]),
                  vSpaceRegular,
                  SettingsList(sections: [
                    SettingsSection(title: "MY SERVICE", tiles: [
                      SettingsTile(
                        icon: RoundedIcon(
                          const Icon(
                            Icons.badge,
                            color: Colors.white,
                          ),
                          background: Colors.blue.shade400,
                        ),
                        title: "Credentials",
                        subtitle:
                            "Add or update your credentials to get more clients",
                        onTap: () {
                          context.router.root.pushWidget(
                              const ViewCredentialsPage(),
                              transitionBuilder: TransitionsBuilders.fadeIn);
                        },
                      ),
                      SettingsTile(
                        icon: RoundedIcon(
                          const Icon(
                            Icons.medical_services,
                            color: Colors.white,
                          ),
                          background: Colors.blue.shade400,
                        ),
                        title: "Services Offered",
                        subtitle:
                            "Add or update the services you offer for the clients ",
                        onTap: () async {
                          context.router.root.pushWidget(
                              const ViewOfferedServicesPage(),
                              transitionBuilder: TransitionsBuilders.fadeIn);
                        },
                      ),
                      SettingsTile(
                        icon: RoundedIcon(
                          const Icon(
                            Icons.lock_clock_rounded,
                            color: Colors.white,
                          ),
                          background: Colors.blue.shade400,
                        ),
                        title: "My Schedules",
                        subtitle:
                            "Add or update your schedules of service you offer ",
                        onTap: () async {
                          context.router.root.pushWidget(
                              const ServiceSchedulesPage(),
                              transitionBuilder: TransitionsBuilders.fadeIn);
                        },
                      )
                    ])
                  ]),
                ],
              );
            }));
  }
}
