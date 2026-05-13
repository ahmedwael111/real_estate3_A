
import 'OrderHistoryPropertyEntity.dart';

class OrderHistoryEntity {
  final int id;
  final String amount;
  final String currency;
  final String status;
  final String? stripeCheckoutSessionId;
  final DateTime createdAt;
  final OrderHistoryPropertyEntity property;

  const OrderHistoryEntity({
    required this.id,
    required this.amount,
    required this.currency,
    required this.status,
    this.stripeCheckoutSessionId,
    required this.createdAt,
    required this.property,
  });

  bool get hasPendingPayment =>
      stripeCheckoutSessionId != null && status == 'pending';
}