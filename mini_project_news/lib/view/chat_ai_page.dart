import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:mini_project_news/provider/provider_chat_ai_page.dart';
import 'package:mini_project_news/provider/provider_custom_bottom_navbar.dart';
import 'package:mini_project_news/widget/custom_bottom_navigation_bar.dart';
import 'package:mini_project_news/widget/custom_title_text.dart';
import 'package:provider/provider.dart';

class ChatAIPage extends StatefulWidget {
  const ChatAIPage({super.key});

  @override
  State<ChatAIPage> createState() => _ChatAIPageState();
}

class _ChatAIPageState extends State<ChatAIPage> {

  @override
  Widget build(BuildContext context) {
    final currentIndexProvider = Provider.of<ProviderBottomNavBar>(context);
    // ignore: unused_local_variable
    int currentIndex = currentIndexProvider.currentIndex;
    
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
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
