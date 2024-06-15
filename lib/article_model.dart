// article_model.dart
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

Future<List<Article>> loadArticles() async {
  final String response = await rootBundle.loadString('assets/articles.json');
  final data = await json.decode(response);
  return (data as List).map((article) => Article.fromJson(article)).toList();
}

class Article {
  final String title;
  final String content;
  final String imageUrl;

  Article({required this.title, required this.content, required this.imageUrl});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'],
      content: json['content'],
      imageUrl: json['imageUrl'],
    );
  }
}
