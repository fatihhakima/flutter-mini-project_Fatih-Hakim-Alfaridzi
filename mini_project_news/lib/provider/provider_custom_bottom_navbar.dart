import 'package:flutter/material.dart';
import 'package:mini_project_news/view/chat_ai_page.dart';
import 'package:mini_project_news/view/home_page.dart';
import 'package:mini_project_news/view/search_page.dart';

class ProviderCustomBottomNavBar extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final List<Widget> _navigationPage = [
    const HomePage(),
    const SearchPage(),
    const ChatAIPage(),
  ];
  List<Widget> get navigationPage => _navigationPage;

  void navigatePage({required int index}) {
    _currentIndex = index;
    notifyListeners();
  }
}