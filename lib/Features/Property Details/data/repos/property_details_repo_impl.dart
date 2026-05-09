import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:real_estate3_a/Features/Property%20Details/data/models/similar/similar.property.dart';

import 'package:real_estate3_a/Features/Property%20Details/domin/repos/propety_details_repo.dart';
import 'package:real_estate3_a/core/api/dio_helper.dart';
import 'package:real_estate3_a/core/constant/app_constants.dart';
import 'package:real_estate3_a/core/errors/error_handler.dart';
import 'package:real_estate3_a/core/errors/failure.dart';

import '../../domin/entities/property/property.details.entity.dart';
import '../../domin/entities/similar/similar.property.entity.dart';
import '../../domin/entities/user/user.reveiw.enitity.dart';
import '../models/property/propety_details.model.dart';
import '../models/user/user.review.model.dart';

class PropertyDetailsRepoImpl implements PropertyDetailsRepo {
  // final DioHelper dioHelper;
  PropertyDetailsRepoImpl();
  @override
  Future<Either<Failure, PropertyDetailsEntity>> getPropertyDetails(
    int id,
  ) async {
    try {
      final response = await DioHelper.getData(
        url: '${AppConstants.getPropertyDetailsEndpoint}$id',
        withAuth: true,
      );
      dynamic data = response.data['data'];
      PropertyDetailsEntity propertyDetailsEntity =
          PropertyDetailsEntity.fromModel(PropertyDetailsModel.fromJson(data));
      return right(propertyDetailsEntity);
    } catch (e) {
      debugPrint('error  in  property details impl  : ${e.toString()}');
      if (e is DioException) {
        return left(ErrorHandler.handle(e).failure);
      }
      debugPrint('error  in  property details impl  : ${e.toString()}');
      return left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, List<SimilarPropertyEntity>>> getPropertySimilars(
    int id,
  ) async {
    try {
      final response = await DioHelper.getData(
        url: '${AppConstants.getPropertyDetailsEndpoint}$id/similar',
        withAuth: true,
      );
      dynamic data = response.data['data'];
      List<SimilarPropertyEntity> similarPropertyEntity = (data as List)
          .map((e) => SimilarPropertyEntity.fromModel(SimilarModel.fromJson(e)))
          .toList();
      return right(similarPropertyEntity);
    } catch (e) {
      debugPrint(
        'error  in  Similars property details impl  : ${e.toString()}',
      );
      if (e is DioException) {
        return left(ErrorHandler.handle(e).failure);
      }
      return left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, List<UserReviewEnitity>>> getPropertyReviews(
    int id,
  ) async {
    try {
      final response = await DioHelper.getData(
        url: '${AppConstants.getPropertyDetailsEndpoint}$id/reviews',
        withAuth: true,
      );
      dynamic data = response.data['data'];
      List<UserReviewEnitity> userReviewsList = (data as List)
          .map((e) => UserReviewEnitity.fromModel(UserReviewMode.fromJson(e)))
          .toList();
      return right(userReviewsList);
    } catch (e) {
      debugPrint('error  in  Reviews property details impl  : ${e.toString()}');
      if (e is DioException) {
        return left(ErrorHandler.handle(e).failure);
      }
      return left(ErrorHandler.handle(e).failure);
    }
  }
}
