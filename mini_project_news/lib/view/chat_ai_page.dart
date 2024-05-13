import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
// import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:mini_project_news/provider/provider_chat_ai_page.dart';
import 'package:mini_project_news/widget/custom_title_text.dart';
import 'package:provider/provider.dart';

class ChatAIPage extends StatefulWidget {
  const ChatAIPage({super.key});

  @override
  State<ChatAIPage> createState() => _ChatAIPageState();
}

class _ChatAIPageState extends State<ChatAIPage> {
  // List<ChatMessage> messages = [];

  // ChatUser currentUser = ChatUser(
  //   id: '0',
  //   firstName: 'Hakim',
  // );

  // ChatUser geminiUser = ChatUser(
  //   id: '1',
  //   firstName: 'Gemini AI',
  //   profileImage:
  //       'https://eduparx.id/blog/wp-content/uploads/2024/05/gemini_ai_google_1701928139717.webp',
  // );

  // final Gemini gemini = Gemini.instance;

  // void onSend(ChatMessage chatMessage) {
  //   setState(() {
  //     messages.insert(0, chatMessage);
  //   });

  //   try {
  //     String question = chatMessage.text;
  //     gemini.streamGenerateContent(question).listen(
  //       (event) {
  //         ChatMessage? lastMessage = messages.firstOrNull;
  //         if (lastMessage != null && lastMessage.user == geminiUser) {
  //           lastMessage = messages.removeAt(0);
  //           print('halo ${messages}');
  //           String response = event.content?.parts?.fold(
  //                   '', (previousValue, element) => '$previousValue$element') ??
  //               '';

  //           lastMessage.text += response;
  //           setState(() {
  //             messages.insert(0, lastMessage!);
  //           });
  //         } else {
  //           String response = event.content?.parts?.fold(
  //                   '', (previousValue, element) => '$previousValue${element.text}') ??
  //               '';

  //           print('halo${response}');

  //           ChatMessage message = ChatMessage(
  //             user: geminiUser,
  //             createdAt: DateTime.now(),
  //             text: response,
  //           );

  //           setState(() {
  //             messages.insert(0, message);
  //           });
  //         }
  //       },
  //     );
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final providerChatAI = Provider.of<ProviderChatAI>(context);

    return Scaffold(
      appBar: AppBar(
        title: const CustomTextTitle(),
        centerTitle: true,
        elevation: 0,
      ),
      body: DashChat(
        currentUser: providerChatAI.currentUser,
        onSend: providerChatAI.onSend,
        messages: providerChatAI.messages,
      ),
    );
  }
}
