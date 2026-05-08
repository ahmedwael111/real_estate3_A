import 'package:dartz/dartz.dart';

import '../../domain/entity/profileEntity.dart';
import '../../domain/repo/profileRepo.dart';
import '../datasources/profileRemoteDataSource.dart';


class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<String, ProfileEntity>> getProfile() async {
    try {
      final profile = await remoteDataSource.getProfile();
      return Right(profile);
    } catch (e) {
      return Left(_parseError(e));
    }
  }

  @override
  Future<Either<String, ProfileEntity>> updateProfile({
    required String name,
    required String location,
    required String phone,
  }) async {
    try {
      final profile = await remoteDataSource.updateProfile(
        name: name,
        location: location,
        phone: phone,
      );
      return Right(profile);
    } catch (e) {
      return Left(_parseError(e));
    }
  }

  @override
  Future<Either<String, String>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String passwordConfirmation,
  }) async {
    try {
      final message = await remoteDataSource.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
        passwordConfirmation: passwordConfirmation,
      );
      return Right(message);
    } catch (e) {
      return Left(_parseError(e));
    }
  }

  @override
  Future<Either<String, String>> logout() async {
    try {
      final message = await remoteDataSource.logout();
      return Right(message);
    } catch (e) {
      return Left(_parseError(e));
    }
  }

  String _parseError(Object e) {
    final msg = e.toString();
    if (msg.startsWith('Exception: ')) {
      return msg.replaceFirst('Exception: ', '');
    }
    return msg;
  }
}