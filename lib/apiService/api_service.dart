import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String _url = 'https://loksewaadmin.loksewatayariapp.com/news/source/TechPana/';

  Future<List<dynamic>> fetchNews() async {
    try {
      final response = await http.get(Uri.parse(_url));

      if (response.statusCode == 200) {
        final decodedBody = utf8.decode(response.bodyBytes);
        final data = json.decode(decodedBody);
        return data['news'];
      } else {
        throw Exception('Failed to fetch news.');
      }
    } catch (error) {
      print('Error fetching news: $error');
      rethrow;
    }
  }
}