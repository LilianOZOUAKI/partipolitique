// models/program_section_model.dart
class ProgramSectionModel {
  final String title;
  final String content;

  ProgramSectionModel({
    required this.title,
    required this.content,
  });

  factory ProgramSectionModel.fromJson(Map<String, dynamic> json) {
    return ProgramSectionModel(
      title: json['title'] ?? '',
      content: json['content'] ?? '',
    );
  }
  
  Map<String, dynamic> toJson() => {
    'title': title,
    'content': content,
  };
}
