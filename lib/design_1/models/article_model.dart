// models/article_model.dart
class ArticleModel {
  final String title;
  final String date;
  final String content;

  ArticleModel({
    required this.title,
    required this.date,
    required this.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['title'] ?? '',
      date: json['date'] ?? '',
      content: json['content'] ?? '',
    );
  }
}

// Exemple d'utilisation :
// final article = ArticleModel.fromJson(jsonData);
