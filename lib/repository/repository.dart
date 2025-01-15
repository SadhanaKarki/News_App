import 'package:practice_provider/apiService/api_service.dart';

import 'package:practice_provider/model/news_model.dart';

class NewsRepository {
  final ApiService _apiService = ApiService();

  Future<List<News>> getNews() async {
    try {
      final List<dynamic> newsData = await _apiService.fetchNews();
      return newsData.map((newsItem) => News.fromJson(newsItem)).toList();
    } catch (error) {
      print('Error in repository: $error');
      rethrow;
    }
  }
}