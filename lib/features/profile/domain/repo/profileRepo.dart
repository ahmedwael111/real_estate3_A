import 'package:dartz/dartz.dart';
import 'package:real_estate3_a/features/profile/domain/entity/profileEntity.dart';

abstract class ProfileRepository {
  Future<Either<String, ProfileEntity>> getProfile();

  Future<Either<String, ProfileEntity>> updateProfile({
    required String name,
    required String location,
    required String phone,
  });

  Future<Either<String, String>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String passwordConfirmation,
  });

  Future<Either<String, String>> logout();
}
