// models/member_model.dart

class MemberModel {
  final String id;
  final String fullName;
  final String role; // ex: Président, Secrétaire, Trésorier
  final String photoUrl; // URL ou chemin local de la photo
  final String bio; // courte biographie
  final String email;
  final String phoneNumber;

  MemberModel({
    required this.id,
    required this.fullName,
    required this.role,
    required this.photoUrl,
    required this.bio,
    required this.email,
    required this.phoneNumber,
  });

  factory MemberModel.fromJson(Map<String, dynamic> json) {
    return MemberModel(
      id: json['id'] ?? '',
      fullName: json['fullName'] ?? '',
      role: json['role'] ?? '',
      photoUrl: json['photoUrl'] ?? '',
      bio: json['bio'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'role': role,
      'photoUrl': photoUrl,
      'bio': bio,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }
}
