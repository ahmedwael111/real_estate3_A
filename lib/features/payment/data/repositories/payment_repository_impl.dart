import 'package:dartz/dartz.dart';
import 'package:real_estate3_a/core/errors/failure.dart';
import 'package:real_estate3_a/features/payment/data/datasources/payment_remote_data_source.dart';
import 'package:real_estate3_a/features/payment/domain/repositories/payment_repository.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentRemoteDataSource remoteDataSource;

  PaymentRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, String>> createOrder(int propertyId) async {
    try {
      final url = await remoteDataSource.createOrder(propertyId);
      return Right(url);
    } on ServerException catch (exception) {
      return Left(ServiceFailure(message: exception.message));
    } catch (exception) {
      return Left(ServiceFailure(message: exception.toString()));
    }
  }
}
