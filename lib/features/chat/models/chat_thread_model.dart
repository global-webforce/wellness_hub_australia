import 'dart:convert';

import 'package:dash_chat_2/dash_chat_2.dart';

class ChatThread {
  List<ChatMessage> messages;
  List<ChatUser> participants;
  ChatThread({
    required this.messages,
    required this.participants,
  });

  Map<String, dynamic> toMap() {
    return {
      'messages': messages.map((x) => x.toJson()).toList(),
      'participants': participants.map((x) => x.toJson()).toList(),
    };
  }

  factory ChatThread.fromMap(Map<String, dynamic> map) {
    return ChatThread(
      messages: List<ChatMessage>.from(
          map['messages']?.map((x) => ChatMessage.fromJson(x))),
      participants: List<ChatUser>.from(
          map['participants']?.map((x) => ChatUser.fromJson(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatThread.fromJson(String source) =>
      ChatThread.fromMap(json.decode(source));
}
