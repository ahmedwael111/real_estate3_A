import 'package:real_estate3_a/features/payment/data/models/agent_model.dart';
import 'package:real_estate3_a/features/payment/domain/entities/agent_entity.dart';
import 'user_mapper.dart';

extension AgentModelExtension on AgentModel {
  AgentEntity get toEntity => AgentEntity(
    id: id,
    title: title,
    bio: bio,
    licenseNumber: licenseNumber,
    company: company,
    user: user.toEntity,
  );
}
