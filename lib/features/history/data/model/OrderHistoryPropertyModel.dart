
import '../../domain/entity/OrderHistoryPropertyEntity.dart';
import 'OrderHistoryPropertyImageModel.dart';

class OrderHistoryPropertyModel extends OrderHistoryPropertyEntity {
  const OrderHistoryPropertyModel({
    required super.id,
    required super.title,
    required super.address,
    required super.price,
    required super.listingType,
    required super.images,
  });

  factory OrderHistoryPropertyModel.fromJson(Map<String, dynamic> json) {
    final rawImages = json['images'] as List<dynamic>? ?? [];
    final images = rawImages
        .map((e) => OrderHistoryPropertyImageModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return OrderHistoryPropertyModel(
      id: json['id'] as int,
      title: json['title'] as String? ?? '',
      address: json['address'] as String? ?? '',
      price: json['price'] as String? ?? '0',
      listingType: json['listing_type'] as String? ?? '',
      images: images,
    );
  }
}