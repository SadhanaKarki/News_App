import 'dart:convert'; 
import 'package:flutter/material.dart'; 
import 'package:http/http.dart' as http;
import 'package:practice_provider/model/news_model.dart'; 

class NewsProvider with ChangeNotifier {
  List<News> _newsList = []; 

  List<News> get newsList => _newsList; 

  Future<void> fetchNews() async {
    final url = 'https://loksewaadmin.loksewatayariapp.com/news/source/TechPana/'; 

    try {
      // Make the API call
      print('Fetching news...');
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        
        final decodedBody = utf8.decode(response.bodyBytes);

        final data = json.decode(decodedBody);

        _newsList = (data['news'] as List)
            .map((newsItem) => News.fromJson(newsItem))
            .toList();

        print('News fetched successfully: ${_newsList.length} items');
        notifyListeners();
      }
      else {
        print('Error: ${response.statusCode}');
        throw Exception('Failed to fetch news.');
      }
    } catch (error) {
      
       print('Error fetching news: $error');
    }
  }
}

