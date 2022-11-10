import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:stacked/stacked.dart';

abstract class ChatService with ReactiveServiceMixin {
  List<ChatUser> get chats;
  Future findOne(int? id);
  Future create(int? threadId, ChatMessage? m);
  Future getAll();
}
