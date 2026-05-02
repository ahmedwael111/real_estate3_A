
import '../../domain/entities/property_cardEntity.dart';
import 'categoryModel.dart';

class PropertyCardModel {
  final int id;
  final String title;
  final String slug;
  final double price;
  final ListingType listingType;


  final String address;
  final String? thumbnailUrl;
  final CategoryModel category;
  final String agentName;

  const PropertyCardModel({
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

  factory PropertyCardModel.fromJson(Map<String, dynamic> json) {

    final images = (json['images'] as List<dynamic>?) ?? [];
    images.sort((a, b) =>
        ((a['sort_order'] as int?) ?? 0).compareTo((b['sort_order'] as int?) ?? 0));
    final thumbnailUrl =
    images.isNotEmpty ? images.first['url'] as String? : null;


    final agent = json['agent'] as Map<String, dynamic>? ?? {};
    final agentUser = agent['user'] as Map<String, dynamic>? ?? {};
    final agentName = agentUser['name'] as String? ?? '';

    return PropertyCardModel(
      id: json['id'] as int,
      title: json['title'] as String,
      slug: json['slug'] as String,
      price: double.parse(json['price'].toString()),
      listingType: (json['listing_type'] as String) == 'rent'
          ? ListingType.rent
          : ListingType.sale,

      address: json['address'] as String,
      thumbnailUrl: thumbnailUrl,
      category: CategoryModel.fromJson(
          json['category'] as Map<String, dynamic>),
      agentName: agentName,
    );
  }

  PropertyCardEntity toEntity() => PropertyCardEntity(
    id: id,
    title: title,
    slug: slug,
    price: price,
    listingType:listingType,

    address: address,
    thumbnailUrl: thumbnailUrl,
    category: category.toEntity(),
    agentName: agentName,
  );
}