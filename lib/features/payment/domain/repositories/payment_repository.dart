import 'package:dartz/dartz.dart';
import 'package:real_estate3_a/core/errors/failure.dart';
import 'package:real_estate3_a/features/payment/domain/entities/order_entity.dart';

abstract class PaymentRepository {
  Future<Either<Failure, String?>> createOrder(int propertyId);
}
