import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:ez_core/ez_core.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wellness_hub_australia/app/app_view_model.dart';
import 'package:wellness_hub_australia/app/shared/ui/scaffold_body_wrapper.dart';
import 'package:wellness_hub_australia/features/chat/viewmodels/chat_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class ChatsDetailPage extends StatelessWidget {
  final int? threadId;
  final int? recipientId;
  const ChatsDetailPage({Key? key, this.threadId, this.recipientId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? userId = getParentViewModel<AppViewModel>(context).user!.id;
    return ViewModelBuilder<ChatViewModel>.reactive(
        viewModelBuilder: () => ChatViewModel(),
        onModelReady: (viewModel) async {
          viewModel.myFocusNode = FocusNode();
          await viewModel.findOne(threadId, recipientId);
        },
        onDispose: (model) {
          model.myFocusNode.dispose();
        },
        builder: (context, viewModel, child) {
          viewModel.myFocusNode.requestFocus();
          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  for (var person in viewModel.chatThread!.participants)
                    if (person.id != "$userId")
                      EzAvatar(
                          radius: 20,
                          imgUrl: "${person.profileImage}",
                          name: "${person.firstName} ${person.lastName}"),
                  hSpaceSmall,
                  for (var person in viewModel.chatThread!.participants)
                    if (person.id != "$userId")
                      Expanded(
                          child:
                              Text("${person.firstName} ${person.lastName}")),
                  /*   hSpaceSmall,
                  Text(
                    "Thread ID: ${viewModel.chatThread?.threadId} | Recipient ID: $recipientId",
                  ) */
                ],
              ),
            ),
            body: ScaffoldBodyWrapper(
                isBusy: viewModel.isBusy,
                disableScrollView: true,
                builder: (context, constrains) {
                  return DashChat(
                    messageOptions: MessageOptions(
                      containerColor: HexColor("#8959B0"),
                      textColor: Colors.white,
                      currentUserContainerColor: Colors.grey,
                      currentUserTextColor: Colors.black,
                      avatarBuilder: ((user, onPressAvatar, onLongPressAvatar) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: EzAvatar(
                              radius: 20,
                              imgUrl: "${user.profileImage}",
                              name: "${user.firstName} ${user.lastName}"),
                        );
                      }),
                      messageTextBuilder:
                          (message, previousMessage, nextMessage) {
                        return Text(
                          message.text,
                          style: const TextStyle(color: Colors.white),
                        );
                      },
                    ),
                    currentUser: ChatUser(
                      id: "$userId",
                    ),
                    onSend: (ChatMessage m) async {
                      await viewModel.create(
                          viewModel.chatThread?.threadId, recipientId, m);
                    },
                    inputOptions: InputOptions(
                      focusNode: viewModel.myFocusNode,
                      sendOnEnter: true,
                    ),
                    messages: viewModel.chatThread!.getMessages,
                    messageListOptions: const MessageListOptions(
                        loadEarlierBuilder: CircularProgressIndicator()),
                  );
                }),
          );
        });
  }
}
