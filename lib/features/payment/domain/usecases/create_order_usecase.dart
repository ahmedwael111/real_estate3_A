import 'package:dartz/dartz.dart';
import 'package:real_estate3_a/core/errors/failure.dart';
import 'package:real_estate3_a/features/payment/domain/entities/order_entity.dart';
import 'package:real_estate3_a/features/payment/domain/repositories/payment_repository.dart';

class CreateOrderUseCase {
  final PaymentRepository repository;

  CreateOrderUseCase({required this.repository});

  Future<Either<Failure, String>> call(int propertyId) async {
    return await repository.createOrder(propertyId);
  }
}
