import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/app/app.logger.dart';
import 'package:wellness_hub_australia/app/shared/ui/setup_dialog_ui.dart';
import 'package:wellness_hub_australia/features/chat/models/chat_thread_model.dart';
import 'package:wellness_hub_australia/features/chat/services/chat_service.dart';

class ChatViewModel extends ReactiveViewModel {
  final log = getLogger('ChatViewModel');
  final navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _chatService = locator<ChatService>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_chatService];

  List<ChatUser> get chats => _chatService.chats;
  ChatThread? _chatThread = ChatThread(messages: [], participants: []);
  ChatThread? get chatThread => _chatThread;

  List<ChatMessage> _messages = [];
  List<ChatMessage> get messages {
    _messages.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return _messages;
  }

  @override
  void onFutureError(error, Object? key) {
    log.e(error);
    _dialogService.showCustomDialog(
        variant: DialogType.error,
        barrierDismissible: true,
        description: error.toString());
    super.onFutureError(error, key);
  }

  Future getAll() async {
    await runBusyFuture(_chatService.getAll(), throwException: true);
  }

  Future<void> create(int? threadId, ChatMessage? m) async {
    _chatThread?.messages.add(m!);
    await runBusyFuture(_chatService.create(threadId, m), throwException: true)
        .onError((error, stackTrace) {
      _chatThread?.messages
          .removeWhere((e) => e.text == m?.text && e.createdAt == m?.createdAt);
    });
  }

  Future findOne(int? id) async {
    await runBusyFuture(
      _chatService.findOne(id),
      throwException: true,
    ).then((value) {
      _chatThread = value;
      _messages = _chatThread!.messages;
      notifyListeners();
    });
  }
}