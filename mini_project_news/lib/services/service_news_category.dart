import 'package:dio/dio.dart';
import 'package:mini_project_news/env/env.dart';
import 'package:mini_project_news/model/model_news_category.dart';
import 'package:mini_project_news/utils/base_url.dart';

class ServiceNewsCategory {
  final Dio _dio = Dio();

  Future<List<ModelNewsCategory>> fetchNewsCategory(String category) async {
    try {
      const newsApiKey = Env.newsApiKey;
      final url =
          '${BaseUrl.baseUrl}top-headlines?country=us&category=$category&apiKey=$newsApiKey';

      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = response.data['articles']; // 'articles' merupakan key atau kata kunci dari responsenya
        final List<ModelNewsCategory> newsCategories = jsonResponse
            .map((categoryJson) => ModelNewsCategory.fromJson(categoryJson))
            .toList();
        
        final List<ModelNewsCategory> filteredCategories = newsCategories.where((category) => category.urlToImage != null && category.description != null).toList();

        return filteredCategories;
      } else {
        throw Exception('Failed to Load News API');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
