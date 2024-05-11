import 'package:dio/dio.dart';
import 'package:mini_project_news/env/env.dart';
import 'package:mini_project_news/model/model_search_news.dart';
import 'package:mini_project_news/utils/base_url.dart';

class ServiceSearchNews {
  final Dio _dio = Dio();

  Future<List<ModelSearchNews>> fetchSearchNews(String search) async {
    try {
      const newsApiKey = Env.newsApiKey;
      final url =
          '${BaseUrl.baseUrl}everything?q=$search&sortBy=popularity&apiKey=$newsApiKey';
          // mobile developer = mobile-developer

      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = response.data['articles']; // 'articles' merupakan key atau kata kunci dari responsenya
        final List<ModelSearchNews> searchNews = jsonResponse
            .map((searchJson) => ModelSearchNews.fromJson(searchJson))
            .toList();
        
        final List<ModelSearchNews> filteredSearch = searchNews.where((search) => search.urlToImage != null && search.title != null).toList();

        return filteredSearch;
      } else {
        throw Exception('Failed to Load News API');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
