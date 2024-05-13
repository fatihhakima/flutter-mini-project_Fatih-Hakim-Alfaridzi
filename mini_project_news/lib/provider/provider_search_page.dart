import 'package:flutter/material.dart';
import 'package:mini_project_news/model/model_search_news.dart';
import 'package:mini_project_news/services/service_search_news.dart';

class ProviderSearchPage extends ChangeNotifier {
  final int _currentIndex = 1;
  int get currentIndex => _currentIndex;

  final ServiceSearchNews _searchNewsService = ServiceSearchNews();
  late TextEditingController searchController;
  late Future<List<ModelSearchNews>> searchNewsResult;

  ProviderSearchPage() {
    searchController = TextEditingController();
    searchNewsResult = Future.value([]);
  }

    void searchNews(String searchText) async {
    searchText = searchText.trim().toLowerCase();
    searchText = searchText.replaceAll(' ', '-');

    if (searchText.isNotEmpty) {
      try {
        searchNewsResult = _searchNewsService.fetchSearchNews(searchText);
        notifyListeners();
      } catch (e) {
        // ignore: avoid_print
        print('Error Searching News: $e');
      }
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
