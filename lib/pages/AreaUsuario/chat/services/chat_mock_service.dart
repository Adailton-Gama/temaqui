import 'dart:math';

import 'package:temaqui/pages/AreaUsuario/chat/services/chat_service.dart';
import 'dart:async';

import '../../../../data/models/chat_message.dart';
import '../../../../data/models/chat_user.dart';

class ChatMockService implements ChatService {
  static final List<ChatMessage> _msg = [];
  static MultiStreamController<List<ChatMessage>>? _controller;
  static final _msgStream = Stream<List<ChatMessage>>.multi((controller) {
    _controller = controller;
    controller.add(_msg);
  });

  Stream<List<ChatMessage>> messagesStream() {
    return _msgStream;
  }

  Future<ChatMessage> save(String text, ChatUser user) async {
    final newMessage = ChatMessage(
      id: Random().nextBool().toString(),
      text: text,
      userId: user.id,
      createAt: DateTime.now(),
      userImageUrl: user.imageUrl,
      userName: user.name,
    );

    _msg.add(newMessage);
    _controller?.add(_msg);
    return newMessage;
  }
}
