import 'package:dio/dio.dart';
import 'package:mini_project_news/env/env.dart';
import 'package:mini_project_news/model/model_news_article.dart';
import 'package:mini_project_news/utils/base_url.dart';

class ServiceNewsArticle {
  final Dio _dio = Dio();
  // List<ModelNewsArticle> serviceNewsArticle = [];

  Future<List<ModelNewsArticle>> fetchNewsArticle() async {
    try {
      const newsApiKey = Env.newsApiKey;
      final url =
          '${BaseUrl.baseUrl}top-headlines?country=us&apiKey=$newsApiKey';

      final response = await _dio.get(url);

      print('Response Status Code: ${response.statusCode}');
      print('Response Data: ${response.data}');

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = response.data['articles'];
        final List<ModelNewsArticle> newsArticles = jsonResponse
            .map((articleJson) => ModelNewsArticle.fromJson(articleJson))
            .toList();
        
        final List<ModelNewsArticle> filteredArticles = newsArticles.where((article) => article.urlToImage != null && article.description != null).toList();

        return filteredArticles;
      } else {
        throw Exception('Failed to Load News API');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
