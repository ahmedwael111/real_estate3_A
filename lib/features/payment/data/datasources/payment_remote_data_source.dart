import 'package:real_estate3_a/features/payment/data/models/order_model.dart';

abstract class PaymentRemoteDataSource {
  Future<String> createOrder(int propertyId);
}
