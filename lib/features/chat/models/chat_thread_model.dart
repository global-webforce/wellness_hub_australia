import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/foundation.dart';

class ChatThread {
  int? threadId;
  List<ChatMessage> messages = [];
  List<ChatUser> participants = [];

  List<ChatMessage> get getMessages {
    messages.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return messages;
  }

  get getParticipants => participants;

  ChatThread({
    this.threadId,
    required this.messages,
    required this.participants,
  });

  ChatThread copyWith({
    int? threadId,
    List<ChatMessage>? messages,
    List<ChatUser>? participants,
  }) {
    return ChatThread(
      threadId: threadId ?? this.threadId,
      messages: messages ?? this.messages,
      participants: participants ?? this.participants,
    );
  }

  @override
  String toString() =>
      'ChatThread(threadId: $threadId, messages: $messages, participants: $participants)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatThread &&
        other.threadId == threadId &&
        listEquals(other.messages, messages) &&
        listEquals(other.participants, participants);
  }

  @override
  int get hashCode =>
      threadId.hashCode ^ messages.hashCode ^ participants.hashCode;
}
