import 'package:cached_network_image/cached_network_image.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:ez_core/ez_core.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wellness_hub_australia/app/app_view_model.dart';
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
          await viewModel.findOne(threadId, recipientId);
        },
        disposeViewModel: true,
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  for (var person in viewModel.chatThread!.participants)
                    if (person.id != "$userId")
                      CachedNetworkImage(
                        imageUrl: "${person.profileImage}",
                        imageBuilder: (context, imageProvider) {
                          return CircleAvatar(
                            backgroundImage: imageProvider,
                            backgroundColor: Colors.white,
                          );
                        },
                        placeholder: (context, url) {
                          return const CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          );
                        },
                        errorWidget: (context, url, error) {
                          return const CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                  hSpaceSmall,
                  for (var person in viewModel.chatThread!.participants)
                    if (person.id != "$userId")
                      Expanded(
                          child:
                              Text("${person.firstName} ${person.lastName}")),
                  hSpaceSmall,
                  Text("ThreadID $threadId RecipientId $recipientId")
                ],
              ),
            ),
            body: DashChat(
              messageOptions: MessageOptions(
                containerColor: HexColor("#8959B0"),
                textColor: Colors.white,
                currentUserContainerColor: Colors.grey,
                currentUserTextColor: Colors.black,
                messageTextBuilder: (message, previousMessage, nextMessage) {
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
                await viewModel.create(threadId, recipientId, m);
              },
              inputOptions: const InputOptions(
                sendOnEnter: true,
              ),
              messages: viewModel.messages,
              messageListOptions: const MessageListOptions(),
            ),
          );
        });
  }
}
