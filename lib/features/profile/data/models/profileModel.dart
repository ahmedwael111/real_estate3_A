
import '../../domain/entity/profileEntity.dart';

class ProfileModel extends ProfileEntity {
  const ProfileModel({
    required super.id,
    required super.name,
    required super.email,
    required super.role,
    required super.createdAt,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    // Handles both wrapped {"data": {...}} and flat response
    final data = json['data'] ?? json;
    return ProfileModel(
      id: data['id'] as int,
      name: data['name'] as String,
      email: data['email'] as String,
      role: data['role'] as String,
      createdAt: data['created_at'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'role': role,
    'created_at': createdAt,
  };
}