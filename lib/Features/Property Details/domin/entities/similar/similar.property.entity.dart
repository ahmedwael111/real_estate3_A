import 'package:real_estate3_a/Features/Property%20Details/data/models/similar/similar.property.dart';

import 'category.property.entity.dart';
import 'image.property.entity.dart';

class SimilarPropertyEntity {
  int? id;
  String? title;
  String? slug;
  String? description;
  String? price;
  String? listingType;
  String? status;
  int? bedrooms;
  int? bathrooms;
  int? kitchens;
  bool? isFeatured;
  int? salesCount;
  dynamic rate;
  double? latitude;
  double? longitude;
  double? lat;
  double? lng;
  String? address;
  dynamic distanceKm;
  dynamic distance;
  Category? category;
  List<Image>? images;
  dynamic agent;

  SimilarPropertyEntity({
    this.id,
    this.title,
    this.slug,
    this.description,
    this.price,
    this.listingType,
    this.status,
    this.bedrooms,
    this.bathrooms,
    this.kitchens,
    this.isFeatured,
    this.salesCount,
    this.rate,
    this.latitude,
    this.longitude,
    this.lat,
    this.lng,
    this.address,
    this.distanceKm,
    this.distance,
    this.category,
    this.images,
    this.agent,
  });

  factory SimilarPropertyEntity.fromModel(SimilarModel json) {
    return SimilarPropertyEntity(
      id: json.id,
      title: json.title,
      slug: json.slug,
      address: json.address,
      description: json.description,
      price: json.price,
      listingType: json.listingType,
      status: json.status,
      bedrooms: json.bedrooms,
      bathrooms: json.bathrooms,
      kitchens: json.kitchens,
      isFeatured: json.isFeatured,
      salesCount: json.salesCount,
      rate: json.rate,
      latitude: json.latitude,
      longitude: json.longitude,
      lat: json.lat,
      lng: json.lng,
      distanceKm: json.distanceKm,
      distance: json.distance,
      category: json.category != null
          ? Category.fromModel(json.category!)
          : null,
      images: json.images != null
          ? (json.images as List).map((e) => Image.fromModel(e)).toList()
          : null,
      agent: json.agent,
    );
  }

  Map<String, dynamic>
  toId5TitleNewCairoGardenVillaTypeASlugNewCairoGardenVillaTypeA69gsfzDescriptionStandaloneVillaWithPrivateGardenMaidSRoomAndCoveredParkingForThreeCarsGatedCommunityWithClubhousePrice1850000000ListingTypeSaleStatusPublishedBedrooms5Bathrooms4Kitchens2IsFeaturedTrueSalesCount7RateNullLatitude3002Longitude3148Lat3002Lng3148AddressNewCairoFifthSettlementDistanceKmNullDistanceNullCategoryId3NameVillasEstatesSlugVillasEstatesFuuoDescriptionDetachedVillasCompoundsAndLargeHomesSortOrder3ImagesId21UrlHttpsImagesUnsplashComPhoto16134904935767fde63acd811W1000Q80SortOrder0Id22UrlHttpsImagesUnsplashComPhoto1600585154340Be6161a56a0cW1000Q80SortOrder1Id23UrlHttpsImagesUnsplashComPhoto160056675319017fb0baa4869W1000Q80SortOrder2Id24UrlHttpsImagesUnsplashComPhoto1600585154526990dced4db0dW1000Q80SortOrder3Id25UrlHttpsImagesUnsplashComPhoto1600607687939Ce8a6c25118cW1000Q80SortOrder4AgentNull() {
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
      'category': category
          ?.toId5TitleNewCairoGardenVillaTypeASlugNewCairoGardenVillaTypeA69gsfzDescriptionStandaloneVillaWithPrivateGardenMaidSRoomAndCoveredParkingForThreeCarsGatedCommunityWithClubhousePrice1850000000ListingTypeSaleStatusPublishedBedrooms5Bathrooms4Kitchens2IsFeaturedTrueSalesCount7RateNullLatitude3002Longitude3148Lat3002Lng3148AddressNewCairoFifthSettlementDistanceKmNullDistanceNullCategoryId3NameVillasEstatesSlugVillasEstatesFuuoDescriptionDetachedVillasCompoundsAndLargeHomesSortOrder3ImagesId21UrlHttpsImagesUnsplashComPhoto16134904935767fde63acd811W1000Q80SortOrder0Id22UrlHttpsImagesUnsplashComPhoto1600585154340Be6161a56a0cW1000Q80SortOrder1Id23UrlHttpsImagesUnsplashComPhoto160056675319017fb0baa4869W1000Q80SortOrder2Id24UrlHttpsImagesUnsplashComPhoto1600585154526990dced4db0dW1000Q80SortOrder3Id25UrlHttpsImagesUnsplashComPhoto1600607687939Ce8a6c25118cW1000Q80SortOrder4AgentNull(),
      'images': images
          ?.map(
            (e) => e
                .toId5TitleNewCairoGardenVillaTypeASlugNewCairoGardenVillaTypeA69gsfzDescriptionStandaloneVillaWithPrivateGardenMaidSRoomAndCoveredParkingForThreeCarsGatedCommunityWithClubhousePrice1850000000ListingTypeSaleStatusPublishedBedrooms5Bathrooms4Kitchens2IsFeaturedTrueSalesCount7RateNullLatitude3002Longitude3148Lat3002Lng3148AddressNewCairoFifthSettlementDistanceKmNullDistanceNullCategoryId3NameVillasEstatesSlugVillasEstatesFuuoDescriptionDetachedVillasCompoundsAndLargeHomesSortOrder3ImagesId21UrlHttpsImagesUnsplashComPhoto16134904935767fde63acd811W1000Q80SortOrder0Id22UrlHttpsImagesUnsplashComPhoto1600585154340Be6161a56a0cW1000Q80SortOrder1Id23UrlHttpsImagesUnsplashComPhoto160056675319017fb0baa4869W1000Q80SortOrder2Id24UrlHttpsImagesUnsplashComPhoto1600585154526990dced4db0dW1000Q80SortOrder3Id25UrlHttpsImagesUnsplashComPhoto1600607687939Ce8a6c25118cW1000Q80SortOrder4AgentNull(),
          )
          .toList(),
      'agent': agent,
    };
  }
}
