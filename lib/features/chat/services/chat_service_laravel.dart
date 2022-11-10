import 'dart:async';
import 'dart:convert';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:wellness_hub_australia/app/api/api_service.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/features/chat/models/chat_thread_model.dart';
import 'package:wellness_hub_australia/features/chat/services/chat_service.dart';
import 'package:wellness_hub_australia/app/api/api_endpoints.dart';
import 'package:stacked/stacked.dart';

class ChatServiceLaravel with ReactiveServiceMixin implements ChatService {
  final _apiService = locator<ApiService>();

  final ReactiveValue<List<ChatUser>> _chats =
      ReactiveValue<List<ChatUser>>([]);

  ChatServiceLaravel() {
    listenToReactiveValues([
      _chats,
    ]);
  }

  @override
  Future findOne(int? id) async {
    return await _apiService.get(
      ApiEndpoints.instance.messageThread(id),
      onSuccess: (res) {
        List<dynamic> messagesJson = jsonDecode(res.body)["messages"];
        List<dynamic> participantsJson = jsonDecode(res.body)["participants"];
        List<ChatMessage> messages = List<ChatMessage>.from(
          messagesJson.map<ChatMessage>(
            (dynamic i) => ChatMessage(
              text: i["text"],
              createdAt: DateTime.parse(i["created_at"]),
              user: ChatUser(
                id: i["user"]["id"].toString(),
                firstName: i["user"]["firstName"],
                lastName: i["user"]["lastName"],
                profileImage: i["user"]["profileImage"],
              ),
            ),
          ),
        );
        List<ChatUser> participants = List<ChatUser>.from(
          participantsJson.map<ChatUser>(
            (dynamic i) => ChatUser(
              id: i["id"].toString(),
              firstName: i["firstName"],
              lastName: i["lastName"],
              profileImage: i["profileImage"],
            ),
          ),
        );
        return ChatThread(messages: messages, participants: participants);

        // fakeChatThread();
      },
      onError: (_) {},
    );
  }

  @override
  Future create(int? threadId, ChatMessage? m) async {
    await _apiService.post(
      ApiEndpoints.instance.messageSend(threadId),
      requestBody: {
        "text": m?.text,
        "recipient": m?.user.id,
      },
      onSuccess: (res) async {
        await getAll();
      },
      onError: (_) {},
    );
  }

  @override
  Future<void> getAll() async {
    await _apiService.get(
      ApiEndpoints.instance.messages(),
      onSuccess: (res) {
        _chats.value = List<ChatUser>.from(
            jsonDecode(res.body).map((model) => ChatUser.fromJson(model)));
      },
      onError: (_) {},
    );
  }

  @override
  List<ChatUser> get chats => _chats.value;
}
