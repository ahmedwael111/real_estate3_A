import 'package:equatable/equatable.dart';

import 'categoryEntity.dart';

enum ListingType { sale, rent }

class PropertyCardEntity extends Equatable {
  final int id;
  final String title;
  final String slug;
  final double price;
  final ListingType listingType;

  final String address;
  final String? thumbnailUrl;
  final CategoryEntity category;
  final String agentName;

  const PropertyCardEntity({
    required this.id,
    required this.title,
    required this.slug,
    required this.price,
    required this.listingType,

    required this.address,
    this.thumbnailUrl,
    required this.category,
    required this.agentName,
  });

  bool get isRent => listingType == ListingType.rent;
  bool get isSale => listingType == ListingType.sale;

  @override
  List<Object?> get props => [
    id, title, slug, price, listingType,
    address, thumbnailUrl,
    category, agentName,
  ];
}