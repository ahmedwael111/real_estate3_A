import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/home_dateEntity.dart';

/// Abstract contract for the home feature data source.
/// The Domain layer depends on this interface — never on any concrete impl.
abstract class HomeRepository {
  /// Fetches all home screen sections:
  /// categories, best-selling, featured, and recommended listings.
  Future<Either<Failure, HomeDataEntity>> getHomeData();
}
