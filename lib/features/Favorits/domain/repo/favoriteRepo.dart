import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/favoriteEntity.dart';

abstract class FavoriteRepository {
  Future<Either<Failure, List<FavoriteEntity>>> getFavorites();
  Future<Either<Failure, void>> addFavorite(int propertyId);
  Future<Either<Failure, void>> removeFavorite(int propertyId);
}