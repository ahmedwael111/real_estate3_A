import 'package:dio/dio.dart';

import '../../../../core/api/dio_helper.dart';
import '../models/profileModel.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileModel> getProfile();

  Future<ProfileModel> updateProfile({
    required String name,
    required String location,
    required String phone,
  });

  Future<String> changePassword({
    required String currentPassword,
    required String newPassword,
    required String passwordConfirmation,
  });

  Future<String> logout();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {

  @override
  Future<ProfileModel> getProfile() async {
    try {
      final response = await DioHelper.getData(
        url: '/api/v1/auth/me',
        withAuth: true,
      );

      return ProfileModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['message'] ?? 'Failed to get profile',
      );
    }
  }

  @override
  Future<ProfileModel> updateProfile({
    required String name,
    required String location,
    required String phone,
  }) async {
    try {
      final response = await DioHelper.putDataWithAuth(
        url: '/api/v1/auth/profile',
        withAuth: true,
        data: {
          'name': name,
          'location': location,
          'phone': phone,
        },
      );

      return ProfileModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['message'] ?? 'Failed to update profile',
      );
    }
  }

  @override
  Future<String> changePassword({
    required String currentPassword,
    required String newPassword,
    required String passwordConfirmation,
  }) async {
    try {
      final response = await DioHelper.putDataWithAuth(
        url: '/api/v1/auth/password',
        withAuth: true,
        data: {
          'current_password': currentPassword,
          'password': newPassword,
          'password_confirmation': passwordConfirmation,
        },
      );

      return response.data['message'];
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['message'] ?? 'Failed to change password',
      );
    }
  }

  @override
  Future<String> logout() async {
    try {
      final response = await DioHelper.postData(
        url: '/api/v1/auth/logout',
        withAuth: true,
        data: {},
      );

      return response.data['message'];
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['message'] ?? 'Failed to logout',
      );
    }
  }
}