import 'OrderHistoryPropertyImageEntity.dart';

class OrderHistoryPropertyEntity {
  final int id;
  final String title;
  final String address;
  final String price;
  final String listingType;
  final List<OrderHistoryPropertyImageEntity> images;

  const OrderHistoryPropertyEntity({
    required this.id,
    required this.title,
    required this.address,
    required this.price,
    required this.listingType,
    required this.images,
  });

  String? get firstImageUrl =>
      images.isNotEmpty ? images.first.url : null;
}
