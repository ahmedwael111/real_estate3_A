import 'package:real_estate3_a/features/payment/data/models/user_model.dart';
import 'package:real_estate3_a/features/payment/domain/entities/agent_entity.dart';

class AgentModel {
  final int id;
  final String title;
  final String bio;
  final String licenseNumber;
  final String company;
  final UserModel user;

  const AgentModel({
    required this.id,
    required this.title,
    required this.bio,
    required this.licenseNumber,
    required this.company,
    required this.user,
  });

  factory AgentModel.fromJson(Map<String, dynamic> json) {
    return AgentModel(
      id: json['id'],
      title: json['title'],
      bio: json['bio'],
      licenseNumber: json['license_number'],
      company: json['company'],
      user: UserModel.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'bio': bio,
      'license_number': licenseNumber,
      'company': company,
      'user': (user).toJson(),
    };
  }
}
