import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entities/home_dateEntity.dart';
import '../../domain/repo/HomeRepo.dart';
import '../RemoteDataSource/HomeRemoteDataSource.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remote;

  const HomeRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, HomeDataEntity>> getHomeData() async {
    try {
      final result = await remote.getHomeData();
      return Right(result.toEntity());
    } on Failure catch (f) {
      return Left(f);
    } catch (e) {
      return Left(ServiceFailure(message: e.toString()));
    }
  }
}