import 'package:flutter/material.dart';
import 'package:mini_project_news/model/model_news_article.dart';
import 'package:mini_project_news/services/service_news_article.dart';

class ProviderViewAllNews extends ChangeNotifier {
  final ServiceNewsArticle _newsArticleService = ServiceNewsArticle();
  late Future<List<ModelNewsArticle>> _newsArticleFuture;

  ProviderViewAllNews() {
    _newsArticleFuture = _newsArticleService.fetchNewsArticle();
  }

  Future<List<ModelNewsArticle>> getAllNewsFuture() => _newsArticleFuture;
}