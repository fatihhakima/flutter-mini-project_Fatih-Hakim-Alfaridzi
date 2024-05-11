import 'package:dio/dio.dart';
import 'package:mini_project_news/env/env.dart';
import 'package:mini_project_news/model/model_news_slider.dart';
import 'package:mini_project_news/utils/base_url.dart';

class ServiceNewsSlider {
  final Dio _dio = Dio();

  Future<List<ModelNewsSlider>> fetchNewsSlider() async {
    try {
      const newsApiKey = Env.newsApiKey;
      final url =
          '${BaseUrl.baseUrl}everything?q=mobile-developer&sortBy=relevance&apiKey=$newsApiKey';
          // mobile developer = mobile-developer

      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = response.data['articles']; // 'articles' merupakan key atau kata kunci dari responsenya
        final List<ModelNewsSlider> newsSliders = jsonResponse
            .map((sliderJson) => ModelNewsSlider.fromJson(sliderJson))
            .toList();
        
        final List<ModelNewsSlider> filteredSliders = newsSliders.where((slider) => slider.urlToImage != null && slider.title != null).toList();

        return filteredSliders;
      } else {
        throw Exception('Failed to Load News API');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
