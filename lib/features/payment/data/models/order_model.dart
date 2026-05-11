import 'package:real_estate3_a/features/payment/domain/entities/order_entity.dart';
import 'package:real_estate3_a/features/payment/data/models/property_model.dart';

class OrderModel {
  final int id;
  final double amount;
  final String currency;
  final String status;
  final String stripeCheckoutSessionId;
  final DateTime createdAt;
  final PropertyModel property;
  final String paymentUrl;

  const OrderModel({
    required this.id,
    required this.amount,
    required this.currency,
    required this.status,
    required this.stripeCheckoutSessionId,
    required this.createdAt,
    required this.property,
    required this.paymentUrl,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      amount: json['amount'],
      currency: json['currency'],
      status: json['status'],
      stripeCheckoutSessionId: json['stripe_checkout_session_id'],
      createdAt: DateTime.parse(json['created_at']),
      property: PropertyModel.fromJson(json['property']),
      paymentUrl: json['payment_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'amount': amount,
      'currency': currency,
      'status': status,
      'stripe_checkout_session_id': stripeCheckoutSessionId,
      'created_at': createdAt.toIso8601String(),
      'property': (property).toJson(),
      'payment_url': paymentUrl,
    };
  }
}
