import 'package:flutter/material.dart';
import 'package:mini_project_news/model/model_news_category.dart';
import 'package:mini_project_news/services/service_news_category.dart';

class ProviderViewCategory extends ChangeNotifier {
  late Future<List<ModelNewsCategory>> _newsCategoryFuture;
  Future<List<ModelNewsCategory>> get newsCategoryFuture => _newsCategoryFuture;

  void fetchNewsCategory(String category) {
    _newsCategoryFuture = _fetchNewsCategory(category.toLowerCase());
  }

Future<List<ModelNewsCategory>> _fetchNewsCategory(String category) async {
  try {
    return await ServiceNewsCategory().fetchNewsCategory(category);
  } catch (e) {
    // ignore: avoid_print
    print('Error fetching category: $e');
    throw Exception('Failed to fetch news category');
  }
}

}