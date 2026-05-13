import 'package:real_estate3_a/core/api/api_consumer.dart';
import 'package:real_estate3_a/core/constant/app_constants.dart';
import 'package:real_estate3_a/features/payment/data/datasources/payment_remote_data_source.dart';

class PaymentRemoteDataSourceImpl implements PaymentRemoteDataSource {
  final ApiConsumer api;

  PaymentRemoteDataSourceImpl({required this.api});

  @override
  Future<String?> createOrder(int propertyId) async {
    final response = await api.post(
      AppConstants.createOrderEndpoint,
      data: {'property_id': propertyId},
      withAuth: true,
    );

    print(response);
    final url = response['data']['payment_url'];

    return url;
  }
}
