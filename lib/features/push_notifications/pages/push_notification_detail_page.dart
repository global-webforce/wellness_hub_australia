import 'package:auto_route/auto_route.dart';
import 'package:ez_core/ez_core.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:wellness_hub_australia/features/push_notifications/viewmodels/push_notifications_viewmodel.dart';
import 'package:wellness_hub_australia/app/shared/ui/scaffold_body_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PushNotificationDetailPage extends StatelessWidget {
  final int? id;

  const PushNotificationDetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PushNotificationsViewModel>.reactive(
        viewModelBuilder: () => PushNotificationsViewModel(),
        onModelReady: (viewModel) {
          viewModel.selectedNotificationId = id;
        },
        builder: (context, viewModel, child) {
          final pushNotification = viewModel.selectedNotification;

          Widget date() {
            return Text(
              "${pushNotification!.createdAt}".toDateNotification(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13,
                height: 1.3,
              ),
            );
          }

          Widget title() {
            return Text(
              "${pushNotification!.notification}",
              maxLines: 1,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 1.3,
              ),
            );
          }

          Widget body() {
            return Text(
              "${pushNotification!.notification}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                height: 1.3,
              ),
            );
          }

          return Scaffold(
            appBar: AppBar(
              leading: const AutoLeadingButton(),
              title: const Text("Notifications"),
              actions: [
                IconButton(
                    tooltip: "Delete Notification",
                    onPressed: () async {
                      await viewModel.delete(pushNotification!.id);
                    },
                    icon: const Icon(Icons.delete_outlined))
              ],
            ),
            //bottomNavigationBar: const ViewLinkButton(),
            body: ScaffoldBodyWrapper(builder: (context, constraints) {
              return Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Row(
                      children: [
                        Expanded(
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    date(),
                                    vSpaceTiny,
                                    title(),
                                    vSpaceSmall,
                                    const Divider(),
                                    vSpaceSmall,
                                    body()
                                  ],
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      child: const Icon(
                        Icons.mail_rounded,
                        color: Colors.white,
                      )),
                ],
              );
            }),
          );
        });
  }
}

class ViewLinkButton extends ViewModelWidget<PushNotificationsViewModel> {
  @override
  bool get reactive => true;

  const ViewLinkButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, PushNotificationsViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.all(15),
      color: Theme.of(context).backgroundColor,
      child: SizedBox(
          height: 40,
          child: EzButton.elevated(
            busy: viewModel.isBusy,
            title: "VIEW DETAILS",
            onTap: () {},
            rounded: true,
          )),
    );
  }
}
