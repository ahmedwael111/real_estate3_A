import 'package:dartz/dartz.dart';

import '../entities/userEntity.dart';

abstract class AuthRepo {
  Future<Either<String, UserEntity>> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
  });

  Future<Either<String, UserEntity>> login({
    required String email,
    required String password,
  });
}