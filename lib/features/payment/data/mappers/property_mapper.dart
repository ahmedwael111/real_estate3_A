import 'package:real_estate3_a/features/payment/data/models/property_model.dart';
import 'package:real_estate3_a/features/payment/domain/entities/property_entity.dart';
import 'agent_mapper.dart';
import 'category_mapper.dart';

extension PropertyModelExtension on PropertyModel {
  PropertyEntity get toEntity => PropertyEntity(
    id: id,
    title: title,
    slug: slug,
    description: description,
    price: price.toString(),
    listingType: listingType,
    status: status,
    bedrooms: bedrooms,
    bathrooms: bathrooms,
    kitchens: kitchens,
    isFeatured: isFeatured,
    salesCount: salesCount,
    rate: rate,
    latitude: latitude,
    longitude: longitude,
    lat: lat,
    lng: lng,
    address: address,
    distanceKm: distanceKm.toInt(),
    distance: distance.toInt(),
    category: category.toEntity,
    images: images,
    agent: agent.toEntity,
  );
}
