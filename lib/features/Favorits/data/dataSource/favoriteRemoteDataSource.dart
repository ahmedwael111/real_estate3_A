import 'package:dio/dio.dart';
import '../../../../core/api/dio_helper.dart';
import '../../../../core/constant/app_constants.dart';
import '../../../../core/errors/failure.dart';
import '../../presentation/cubit/favorite_cubit.dart';
import '../models/favoriteModel.dart';

abstract class FavoriteRemoteDataSource {
  Future<FavoriteListModel> getFavorites();
  Future<void> addFavorite(int propertyId);
  Future<void> removeFavorite(int propertyId);
}

class FavoriteRemoteDataSourceImpl implements FavoriteRemoteDataSource {
  const FavoriteRemoteDataSourceImpl();

  @override
  Future<FavoriteListModel> getFavorites() async {
    try {
      final response = await DioHelper.getData(
        url: AppConstants.favorites,
        withAuth: true,
      );
      print(response.data);
      print(response.data.runtimeType);
      return FavoriteListModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw ServiceFailure(message: e.toString());
    }
  }

  @override
  Future<void> addFavorite(int propertyId) async {
    await DioHelper.postData(
      url: AppConstants.favorites,
      data: {'property_id': propertyId},
      withAuth: true,
    );
  }
  @override
  Future<void> removeFavorite(int propertyId) async {
    try {
      await DioHelper.deleteDataWithAuth(
        url: '${AppConstants.favorites}/$propertyId',
        withAuth: true,
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