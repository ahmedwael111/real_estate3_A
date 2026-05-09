import 'package:real_estate3_a/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:real_estate3_a/features/Property%20Details/domin/entities/property/property.details.entity.dart';
import 'package:real_estate3_a/features/Property%20Details/domin/entities/similar/similar.property.entity.dart';

import '../entities/user/user.reveiw.enitity.dart';

abstract class PropertyDetailsRepo {
  Future<Either<Failure, PropertyDetailsEntity>> getPropertyDetails(
    int propertyId,
  );
  Future<Either<Failure, List<SimilarPropertyEntity>>> getPropertySimilars(
    int propertyId,
  );
  Future<Either<Failure, List<UserReviewEnitity>>> getPropertyReviews(
    int propertyId,
  );
}
