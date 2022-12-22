import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:stacked/stacked.dart';
import 'package:wellness_hub_australia/features/chat/models/chat_thread_model.dart';

abstract class ChatService with ReactiveServiceMixin {
  List<ChatUser> get chats;
  ChatThread get currentThread;
  Future findOne(int? threadId, int? recipientId);
  Future create(int? threadId, int? recipientId, ChatMessage? m);
  Future getAll();
}
