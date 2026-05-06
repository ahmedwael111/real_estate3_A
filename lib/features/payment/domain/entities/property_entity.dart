import 'category_entity.dart';
import 'agent_entity.dart';

class PropertyEntity {
  final int id;
  final String title;
  final String slug;
  final String description;
  final String price;
  final String listingType;
  final String status;
  final int bedrooms;
  final int bathrooms;
  final int kitchens;
  final bool isFeatured;
  final int salesCount;
  final double? rate;
  final double latitude;
  final double longitude;
  final double lat;
  final double lng;
  final String address;
  final int distanceKm;
  final int distance;
  final CategoryEntity category;
  final List<String> images;
  final AgentEntity agent;

  const PropertyEntity({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.price,
    required this.listingType,
    required this.status,
    required this.bedrooms,
    required this.bathrooms,
    required this.kitchens,
    required this.isFeatured,
    required this.salesCount,
    this.rate,
    required this.latitude,
    required this.longitude,
    required this.lat,
    required this.lng,
    required this.address,
    required this.distanceKm,
    required this.distance,
    required this.category,
    required this.images,
    required this.agent,
  });
}
