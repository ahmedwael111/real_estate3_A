import 'package:dio/dio.dart';
import 'package:real_estate3_a/core/constant/app_constants.dart';
import '../../../../core/api/dio_helper.dart';
import '../../../../core/errors/failure.dart';
import '../models/homeDataModel.dart';

abstract class HomeRemoteDataSource {
  Future<HomeDataModel> getHomeData();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {

  const HomeRemoteDataSourceImpl();

  @override
  Future<HomeDataModel> getHomeData() async {
    try {
      final response = await DioHelper.getData(
        url: AppConstants.home,
        withAuth: false,
      );
      print(response.data);
      return HomeDataModel.fromJson(
        response.data as Map<String, dynamic>,
      );

    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw ServiceFailure(message: e.toString());
    }
  }

  Failure _handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.connectionError) {
      return NoInternetFailure(message: 'No Internet Connection');
    }

    if (e.response != null) {
      return ApiFailure(
        message: e.response?.data?['message'] ?? 'Server Error',
      );
    }

    return ServiceFailure(message: e.message ?? 'Unexpected Error');
  }
}