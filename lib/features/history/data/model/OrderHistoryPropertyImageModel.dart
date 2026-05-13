

import '../../domain/entity/OrderHistoryPropertyImageEntity.dart';

class OrderHistoryPropertyImageModel extends OrderHistoryPropertyImageEntity {
  const OrderHistoryPropertyImageModel({
    required super.id,
    required super.url,
    required super.sortOrder,
  });

  factory OrderHistoryPropertyImageModel.fromJson(Map<String, dynamic> json) {
    return OrderHistoryPropertyImageModel(
      id: json['id'] as int,
      url: json['url'] as String,
      sortOrder: json['sort_order'] as int,
    );
  }
}