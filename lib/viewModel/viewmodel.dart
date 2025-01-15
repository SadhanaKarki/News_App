import 'package:flutter/material.dart';
import 'package:practice_provider/repository/repository.dart';
import 'package:practice_provider/model/news_model.dart';

class NewsViewModel with ChangeNotifier {
  final NewsRepository _newsRepository = NewsRepository();
  
  List<News> _newsList = [];
  List<News> get newsList => _newsList;

  Future<void> fetchNews() async {
    try {
      _newsList = await _newsRepository.getNews();
      notifyListeners();
    } catch (error) {
      print('Error in ViewModel: $error');
    }
  }
}

