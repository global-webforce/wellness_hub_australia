import 'package:ez_ui/ez_ui.dart';
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
        viewModelBuilder: () => ChatViewModel(),
        onModelReady: (viewModel) async {
          await viewModel.getAll();
        },
        disposeViewModel: true,
        builder: (context, viewModel, child) {
          return Scaffold(
              appBar: AppBar(
                leading: ezDrawerToggle(context),
                title: const Text("Chats"),
                automaticallyImplyLeading: false,
              ),
              body: ListGridViewWrapper(
                isBusy: viewModel.isBusy,
                emptyIndicatorWidget: const EmptyDisplay(
                  icon: Icons.chat_rounded,
                  title: "You have no chats",
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
                              id: viewModel
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
