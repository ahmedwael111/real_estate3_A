import 'property_entity.dart';

class OrderEntity {
  final int id;
  final String amount;
  final String currency;
  final String status;
  final String stripeCheckoutSessionId;
  final DateTime createdAt;
  final PropertyEntity property;
  final String paymentUrl;

  const OrderEntity({
    required this.id,
    required this.amount,
    required this.currency,
    required this.status,
    required this.stripeCheckoutSessionId,
    required this.createdAt,
    required this.property,
    required this.paymentUrl,
  });
}
