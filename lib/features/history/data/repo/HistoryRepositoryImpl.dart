
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entity/OrderHistoryEntity.dart';
import '../../domain/repo/HistoryRepository.dart';
import '../dataSource/HistoryRemoteDataSource.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final HistoryRemoteDataSource remoteDataSource;

  HistoryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<OrderHistoryEntity>>> getOrders() async {
    try {
      final orders = await remoteDataSource.getOrders();
      return Right(orders);
    } on ServerException catch (e) {
      return Left(ServiceFailure(message: e.message));
    } catch (e) {
      return Left(ServiceFailure(message: e.toString()));
    }
  }
}
