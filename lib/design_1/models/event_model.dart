// models/event_model.dart
class EventModel {
  final String title;
  final String location;
  final String date;
  final String description;

  EventModel({
    required this.title,
    required this.location,
    required this.date,
    required this.description,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      title: json['title'] ?? '',
      location: json['location'] ?? '',
      date: json['date'] ?? '',
      description: json['description'] ?? '',
    );
  }
}

// Exemple d'utilisation :
// final event = EventModel.fromJson(jsonData);
