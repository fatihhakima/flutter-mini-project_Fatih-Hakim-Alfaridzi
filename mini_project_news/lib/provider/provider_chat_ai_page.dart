import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class ProviderChatAI extends ChangeNotifier {
  List<ChatMessage> messages = [];
  final Gemini gemini = Gemini.instance;

  ChatUser currentUser = ChatUser(
    id: '0',
    firstName: 'Hakim',
  );

  ChatUser geminiUser = ChatUser(
    id: '1',
    firstName: 'Gemini AI',
    profileImage:
        'https://eduparx.id/blog/wp-content/uploads/2024/05/gemini_ai_google_1701928139717.webp',
  );

  void onSend(ChatMessage chatMessage) {
    messages.insert(0, chatMessage);
    notifyListeners();
    processMessage(chatMessage);
  }

  Future<void> processMessage(ChatMessage chatMessage) async {
    try {
      String question = chatMessage.text;
      gemini.streamGenerateContent(question).listen(
        (event) {
          ChatMessage? lastMessage = messages.firstOrNull;
          if (lastMessage != null && lastMessage.user == geminiUser) {
            lastMessage = messages.removeAt(0);
            String response = event.content?.parts?.fold(
                    '', (previousValue, element) => '$previousValue$element') ??
                '';
            lastMessage.text += response;
            messages.insert(0, lastMessage);
          } else {
            String response = event.content?.parts?.fold(
                    '', (previousValue, element) => '$previousValue${element.text}') ??
                '';
            ChatMessage message = ChatMessage(
              user: geminiUser,
              createdAt: DateTime.now(),
              text: response,
            );
            messages.insert(0, message);
          }
          notifyListeners(); // Notify listeners after updating messages
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
