import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:stacked/stacked.dart';

abstract class ChatService with ReactiveServiceMixin {
  List<ChatUser> get chats;
  Future findOne(int? threadId, int? recipientId);
  Future create(int? threadId, int? recipientId, ChatMessage? m);
  Future getAll();
}
