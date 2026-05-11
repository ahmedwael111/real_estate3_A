import 'package:real_estate3_a/features/payment/domain/entities/property_entity.dart';
import 'package:real_estate3_a/features/payment/data/models/category_model.dart';
import 'package:real_estate3_a/features/payment/data/models/agent_model.dart';

class PropertyModel {
  final int id;
  final String title;
  final String slug;
  final String description;
  final double price;
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
  final double distanceKm;
  final double distance;
  final CategoryModel category;
  final List<String> images;
  final AgentModel agent;

  const PropertyModel({
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

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      description: json['description'],
      price: json['price'],
      listingType: json['listing_type'],
      status: json['status'],
      bedrooms: json['bedrooms'],
      bathrooms: json['bathrooms'],
      kitchens: json['kitchens'],
      isFeatured: json['is_featured'],
      salesCount: json['sales_count'],
      rate: json['rate']?.toDouble(),
      latitude: json['latitude']?.toDouble() ?? 0.0,
      longitude: json['longitude']?.toDouble() ?? 0.0,
      lat: json['lat']?.toDouble() ?? 0.0,
      lng: json['lng']?.toDouble() ?? 0.0,
      address: json['address'],
      distanceKm: json['distance_km'] ?? 0,
      distance: json['distance'] ?? 0,
      category: CategoryModel.fromJson(json['category']),
      images: List<String>.from(json['images'] ?? []),
      agent: AgentModel.fromJson(json['agent']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'slug': slug,
      'description': description,
      'price': price,
      'listing_type': listingType,
      'status': status,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'kitchens': kitchens,
      'is_featured': isFeatured,
      'sales_count': salesCount,
      'rate': rate,
      'latitude': latitude,
      'longitude': longitude,
      'lat': lat,
      'lng': lng,
      'address': address,
      'distance_km': distanceKm,
      'distance': distance,
      'category': (category).toJson(),
      'images': images,
      'agent': (agent).toJson(),
    };
  }
}
