

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entity/OrderHistoryEntity.dart';

abstract class HistoryRepository {
  Future<Either<Failure, List<OrderHistoryEntity>>> getOrders();
}