import 'package:flutter/material.dart';
import 'package:mini_project_news/model/model_custom_category.dart';
import 'package:mini_project_news/model/model_news_article.dart';
import 'package:mini_project_news/model/model_news_slider.dart';
import 'package:mini_project_news/services/category_data.dart';
import 'package:mini_project_news/services/service_news_article.dart';
import 'package:mini_project_news/services/service_news_slider.dart';

class ProviderHomePage extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  // Custom Slider
  final ServiceNewsSlider _newsSliderService = ServiceNewsSlider();
  late Future<List<ModelNewsSlider>> _newsSliderFuture;
  int _activeIndexSlider = 0;
  int get activeIndexSlider => _activeIndexSlider;

  // Categories
  final ServiceCategoryData _categoryDataService = ServiceCategoryData();
  late List<CustomCategoryModel> _categories = [];
  List<CustomCategoryModel> get categories => _categories;

  // News Article List View
  final ServiceNewsArticle _newsArticleService = ServiceNewsArticle();
  late Future<List<ModelNewsArticle>> _newsArticleFuture;
  List<ModelNewsArticle>? _newsArticles;
  List<ModelNewsArticle>? get newsArticles => _newsArticles;

  ProviderHomePage() {
    // Custom Slider
    _newsSliderFuture = _newsSliderService.fetchNewsSlider();
    // Categories
    _categories = _categoryDataService.getCategories();
    // News Article
    _newsArticleFuture = _newsArticleService.fetchNewsArticle();
  }

  // Custom Slider
  Future<List<ModelNewsSlider>> getNewsSliderFuture() {
    return _newsSliderFuture;
  }
  void setActiveIndexSlider(int index) {
    _activeIndexSlider = index;
    notifyListeners();
  }

  // Categories
  List<CustomCategoryModel> getCategories() {
    return _categories;
  }

  // News Article
  Future<List<ModelNewsArticle>> getNewsArticleFuture() {
    return _newsArticleFuture;
  }
}