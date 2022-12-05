import 'package:ez_dashboard/ez_drawer_button.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/app/shared/ui/empty_display.dart';
import 'package:wellness_hub_australia/features/chat/viewmodels/chat_viewmodel.dart';
import 'package:wellness_hub_australia/features/chat/pages/chats_detail_page.dart';
import 'package:wellness_hub_australia/features/chat/widgets/chat_tile.dart';
import 'package:wellness_hub_australia/app/shared/ui/list_gridview_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatViewModel>.reactive(
        viewModelBuilder: () => locator<ChatViewModel>(),
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
                title: const Text("Chats"),
              ),
              body: ListGridViewWrapper(
                isBusy: viewModel.isBusy,
                emptyIndicatorWidget: const EmptyDisplay(
                  icon: Icons.chat_rounded,
                  title: "No chats",
                ),
                onRefresh: () async {
                  await viewModel.getAll();
                },
                itemCount: viewModel.chats.length,
                builder: (context, constraints) {
                  return ListView.builder(
                      itemCount: viewModel.chats.length,
                      itemBuilder: (context, index) {
                        return ChatTile(
                          onTap: () {
                            viewModel.navigationService
                                .navigateToView(ChatsDetailPage(
                              threadId: viewModel
                                  .chats[index].customProperties?["thread_id"],
                            ));
                          },
                          chatUser: viewModel.chats[index],
                        );
                      });
                },
              ));
        });
  }
}
