import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/favoriteEntity.dart';
import '../../domain/repo/favoriteRepo.dart';
import '../dataSource/favoriteRemoteDataSource.dart';


class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteRemoteDataSource remote;

  const FavoriteRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, List<FavoriteEntity>>> getFavorites() async {
    try {
      final result = await remote.getFavorites();
      return Right(result.toEntity());
    } on Failure catch (f) {
      return Left(f);
    } catch (e) {
      return Left(ServiceFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addFavorite(int propertyId) async {
    try {
      await remote.addFavorite(propertyId);
      return const Right(null);
    } on Failure catch (f) {
      return Left(f);
    } catch (e) {
      return Left(ServiceFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeFavorite(int propertyId) async {
    try {
      await remote.removeFavorite(propertyId);
      return const Right(null);
    } on Failure catch (f) {
      return Left(f);
    } catch (e) {
      return Left(ServiceFailure(message: e.toString()));
    }
  }
}