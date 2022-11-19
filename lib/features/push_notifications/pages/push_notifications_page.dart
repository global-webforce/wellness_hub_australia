import 'package:ez_dashboard/ez_drawer_button.dart';
import 'package:wellness_hub_australia/app/shared/ui/empty_display.dart';
import 'package:wellness_hub_australia/features/push_notifications/viewmodels/push_notifications_viewmodel.dart';
import 'package:wellness_hub_australia/app/shared/ui/list_gridview_wrapper.dart';
import 'package:wellness_hub_australia/features/push_notifications/widgets/push_notification_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:stacked/stacked.dart';

class PushNotificationsPage extends StatelessWidget {
  const PushNotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PushNotificationsViewModel>.reactive(
        viewModelBuilder: () => PushNotificationsViewModel(),
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
              body: ListGridViewWrapper(
                emptyIndicatorWidget: const EmptyDisplay(
                    icon: Icons.notifications,
                    title: "You have 0 notifications"),
                isBusy: viewModel.isBusy,
                onRefresh: () async {
                  viewModel.getAll();
                },
                itemCount: viewModel.pushNotifications.length,
                builder: (context, constraints) {
                  return AlignedGridView.count(
                    padding: const EdgeInsets.all(15),
                    crossAxisCount: 1,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    itemCount: viewModel.pushNotifications.length,
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
