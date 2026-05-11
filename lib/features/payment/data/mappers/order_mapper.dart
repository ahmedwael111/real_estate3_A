import 'package:real_estate3_a/features/payment/data/mappers/property_mapper.dart';
import 'package:real_estate3_a/features/payment/data/models/order_model.dart';
import 'package:real_estate3_a/features/payment/domain/entities/order_entity.dart';

extension OrderModelExtension on OrderModel {
  OrderEntity get toEntity => OrderEntity(
    id: id,
    amount: amount.toString(),
    currency: currency,
    status: status,
    stripeCheckoutSessionId: stripeCheckoutSessionId,
    createdAt: createdAt,
    property: property.toEntity,
    paymentUrl: paymentUrl,
  );
}
