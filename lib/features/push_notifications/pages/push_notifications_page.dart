import 'package:ez_dashboard/ez_drawer_button.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/app/shared/ui/empty_display.dart';
import 'package:wellness_hub_australia/features/push_notifications/viewmodels/push_notifications_viewmodel.dart';
import 'package:wellness_hub_australia/app/shared/ui/list_and_grid_view_wrapper.dart';
import 'package:wellness_hub_australia/features/push_notifications/widgets/push_notification_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PushNotificationsPage extends StatelessWidget {
  const PushNotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PushNotificationsViewModel>.reactive(
        viewModelBuilder: () => locator<PushNotificationsViewModel>(),
        disposeViewModel: false,
        fireOnModelReadyOnce: true,
        onModelReady: (viewModel) async {
          await viewModel.getAll();
        },
        builder: (context, viewModel, child) {
          return Scaffold(
              appBar: AppBar(
                leading: ezDrawerButton(context),
                automaticallyImplyLeading: false,
                title: const Text("Notifications"),
              ),
              body: ListAndGridViewWrapper(
                emptyIndicatorWidget: const EmptyDisplay(
                    icon: Icons.notifications, title: "No notifications"),
                isBusy: viewModel.isBusy,
                onRefresh: () async {
                  viewModel.getAll();
                },
                itemCount: viewModel.pushNotifications.length,
                builder: (context, constraints) {
                  return ListView.separated(
                    padding: const EdgeInsets.all(15),
                    itemCount: viewModel.pushNotifications.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemBuilder: (context, index) {
                      return PushNotificationCard(
                        onTap: () {
                          viewModel.goToNotifDetail(
                              viewModel.pushNotifications[index].id);
                        },
                        pushNotification: viewModel.pushNotifications[index],
                      );
                    },
                  );
                },
              ));
        });
  }
}
