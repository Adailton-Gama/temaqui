import 'package:temaqui/pages/AreaUsuario/chat/services/chat_mock_service.dart';

import '../../../../data/models/chat_message.dart';
import '../../../../data/models/chat_user.dart';

abstract class ChatService {
  Stream<List<ChatMessage>> messagesStream();
  Future<ChatMessage> save(String text, ChatUser user);

  factory ChatService() {
    return ChatMockService();
  }
}
