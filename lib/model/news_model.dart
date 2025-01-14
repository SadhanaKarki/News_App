import 'package:html/parser.dart' show parse;
import 'package:html_unescape/html_unescape.dart';

class News {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final String publishedAt;
  final String newsLink;
  final String source;

  News({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.publishedAt,
    required this.newsLink,
    required this.source,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    String decodeHtmlEntities(String text) {
      String unescapedText = HtmlUnescape().convert(text);
      var document = parse(unescapedText);
      return document.body?.text ?? unescapedText;
    }

    return News(
      id: json['id'],
      title: json['title'],
      description: decodeHtmlEntities(json['description']),
      imageUrl: json['image'],
      publishedAt: json['published_at'],
      newsLink: json['news_link'],
      source: json['source'],
    );
  }
}