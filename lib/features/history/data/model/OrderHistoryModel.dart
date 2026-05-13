
import '../../domain/entity/OrderHistoryEntity.dart';
import 'OrderHistoryPropertyModel.dart';

class OrderHistoryModel extends OrderHistoryEntity {
  const OrderHistoryModel({
    required super.id,
    required super.amount,
    required super.currency,
    required super.status,
    super.stripeCheckoutSessionId,
    required super.createdAt,
    required super.property,
  });

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) {
    return OrderHistoryModel(
      id: json['id'] as int,
      amount: json['amount'] as String? ?? '0',
      currency: json['currency'] as String? ?? 'usd',
      status: json['status'] as String? ?? 'pending',
      stripeCheckoutSessionId: json['stripe_checkout_session_id'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      property: OrderHistoryPropertyModel.fromJson(
        json['property'] as Map<String, dynamic>,
      ),
    );
  }
}