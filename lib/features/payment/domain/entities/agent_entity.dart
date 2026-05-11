import 'package:equatable/equatable.dart';

class UserEntity {
  final int id;
  final String name;
  final String email;
  final String role;
  final DateTime createdAt;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.createdAt,
  });
}

class AgentEntity {
  final int id;
  final String title;
  final String bio;
  final String? licenseNumber;
  final String company;
  final UserEntity user;

  const AgentEntity({
    required this.id,
    required this.title,
    required this.bio,
    this.licenseNumber,
    required this.company,
    required this.user,
  });
}
