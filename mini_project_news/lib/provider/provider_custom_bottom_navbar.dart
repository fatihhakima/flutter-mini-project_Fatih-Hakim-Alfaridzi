import 'package:flutter/material.dart';
import 'package:mini_project_news/view/chat_ai_page.dart';
import 'package:mini_project_news/view/home_page.dart';
import 'package:mini_project_news/view/search_page.dart';

class ProviderBottomNavBar extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        break;
      case 1:
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const SearchPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          // ignore: prefer_const_constructors
          MaterialPageRoute(builder: (context) => ChatAIPage()),
        );
        break;
    }
    setCurrentIndex(index);
  }
}
