import 'package:real_estate3_a/features/payment/data/models/user_model.dart';
import 'package:real_estate3_a/features/payment/domain/entities/agent_entity.dart';

extension UserModelExtension on UserModel {
  UserEntity get toEntity => UserEntity(
    id: id,
    name: name,
    email: email,
    role: role,
    createdAt: createdAt,
  );
}
