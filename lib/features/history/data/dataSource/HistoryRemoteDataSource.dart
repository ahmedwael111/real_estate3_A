
import '../../../../core/api/api_consumer.dart';
import '../../../../core/constant/app_constants.dart';
import '../model/OrderHistoryModel.dart';

abstract class HistoryRemoteDataSource {
  Future<List<OrderHistoryModel>> getOrders();
}
class HistoryRemoteDataSourceImpl implements HistoryRemoteDataSource {
  final ApiConsumer api;

  HistoryRemoteDataSourceImpl({required this.api});

  @override
  Future<List<OrderHistoryModel>> getOrders() async {
    final response = await api.get(
      AppConstants.orders, // e.g. '/orders'
      withAuth: true,
    );

    final rawList = response['data'] as List<dynamic>? ?? [];

    return rawList
        .map((e) => OrderHistoryModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}