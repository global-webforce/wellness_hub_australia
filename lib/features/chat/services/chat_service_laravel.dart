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

  final ReactiveValue<ChatThread> _currentThread =
      ReactiveValue<ChatThread>(ChatThread(
    threadId: null,
    messages: [],
    participants: [],
  ));

  ChatServiceLaravel() {
    listenToReactiveValues([
      _chats,
      _currentThread,
    ]);
  }

  @override
  Future findOne(int? threadId, int? recipientId) async {
    return await _apiService.get(
      (threadId != null)
          ? ApiEndpoints.instance.messageThreadViaThreadId(threadId)
          : ApiEndpoints.instance.messageThreadViaRecipientId(recipientId),
      onSuccess: (res) {
        List<dynamic> messagesJson = jsonDecode(res.body)["messages"];
        List<dynamic> participantsJson = jsonDecode(res.body)["participants"];

        int? threadId = jsonDecode(res.body)["thread_id"];
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
        _currentThread.value = ChatThread(
          threadId: threadId,
          messages: messages,
          participants: participants,
        );
      },
      onError: (_) {},
    );
  }

  @override
  Future create(int? threadId, int? recipientId, ChatMessage? m) async {
    await _apiService.post(
      ApiEndpoints.instance.messageSend(threadId, recipientId),
      requestBody: {
        "text": m?.text,
        "recipient": recipientId,
      },
      onSuccess: (res) async {
        if (threadId != null) await findOne(threadId, recipientId);

        ChatUser? v = _chats.value[_chats.value
            .indexWhere((e) => e.customProperties?["thread_id"] == threadId)];

        v.customProperties?["text"] = m?.text;
        v.customProperties?["created_at"] = DateTime.now().toIso8601String();

        _chats.value[_chats.value.indexWhere(
            (e) => e.customProperties?["thread_id"] == threadId)] = v;
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

  @override
  ChatThread get currentThread => _currentThread.value;
}
