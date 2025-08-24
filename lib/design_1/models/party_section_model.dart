// models/party_section_model.dart
class PartySectionModel {
  final String title;
  final String content;

  PartySectionModel({
    required this.title,
    required this.content,
  });

  factory PartySectionModel.fromJson(Map<String, dynamic> json) {
    return PartySectionModel(
      title: json['title'] ?? '',
      content: json['content'] ?? '',
    );
  }
}
