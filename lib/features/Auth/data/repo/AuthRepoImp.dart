
import 'package:dartz/dartz.dart';
import 'package:real_estate3_a/core/api/dio_helper.dart';
import 'package:real_estate3_a/core/constant/app_constants.dart';
import 'package:dio/dio.dart';
import '../../../../core/di.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/security/security_helper.dart';
import '../../domain/entities/userEntity.dart';
import '../../domain/repo/AuthRepo.dart';
import '../models/user_model.dart';

class AuthRepoImpl extends AuthRepo {


  @override
  Future<Either<String, UserEntity>> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    try {
      final response = await DioHelper.postData(
        url: AppConstants.registerEndpoint,
        data: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': password,
        },
      );

      final data = response.data["data"];

      final userModel = UserModel.fromJson({
        ...data["user"],
        "token": data["token"],
      });


      await getIt<AuthStorage>().setToken(userModel.token);
      await getIt<AuthStorage>().setUserId(userModel.id.toString());

      return right(UserEntity.fromModel(userModel));
    } on ServerException catch (e) {
      return left(e.message.toString());
    } catch (e) {
      return left(e.toString());
    }
  }


  @override
  Future<Either<String, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await DioHelper.postData(
        url: AppConstants.loginEndpoint,
        data: {
          'email': email,
          'password': password,
        },
      );

      final data = response.data["data"];

      final userModel = UserModel.fromJson({
        ...data["user"],
        "token": data["token"],
      });


      await getIt<AuthStorage>().setToken(userModel.token);
      await getIt<AuthStorage>().setUserId(userModel.id.toString());

      return right(UserEntity.fromModel(userModel));

    } catch (e) {
      if (e is DioException) {
        final message = e.response?.data["message"];
        return left(message ?? "Login failed");
      }
      return left("Unexpected error");
    }
  }
}