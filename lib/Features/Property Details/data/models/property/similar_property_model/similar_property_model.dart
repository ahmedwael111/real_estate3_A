import 'category.dart';
import 'image.dart';

class SimilarPropertyModel {
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

  SimilarPropertyModel({
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

  factory SimilarPropertyModel.fromId5TitleNewCairoGardenVillaTypeASlugNewCairoGardenVillaTypeA69gsfzDescriptionStandaloneVillaWithPrivateGardenMaidSRoomAndCoveredParkingForThreeCarsGatedCommunityWithClubhousePrice1850000000ListingTypeSaleStatusPublishedBedrooms5Bathrooms4Kitchens2IsFeaturedTrueSalesCount7RateNullLatitude3002Longitude3148Lat3002Lng3148AddressNewCairoFifthSettlementDistanceKmNullDistanceNullCategoryId3NameVillasEstatesSlugVillasEstatesFuuoDescriptionDetachedVillasCompoundsAndLargeHomesSortOrder3ImagesId21UrlHttpsImagesUnsplashComPhoto16134904935767fde63acd811W1000Q80SortOrder0Id22UrlHttpsImagesUnsplashComPhoto1600585154340Be6161a56a0cW1000Q80SortOrder1Id23UrlHttpsImagesUnsplashComPhoto160056675319017fb0baa4869W1000Q80SortOrder2Id24UrlHttpsImagesUnsplashComPhoto1600585154526990dced4db0dW1000Q80SortOrder3Id25UrlHttpsImagesUnsplashComPhoto1600607687939Ce8a6c25118cW1000Q80SortOrder4AgentNull(
    Map<String, dynamic> json,
  ) {
    return SimilarPropertyModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      price: json['price'] as String?,
      listingType: json['listing_type'] as String?,
      status: json['status'] as String?,
      bedrooms: json['bedrooms'] as int?,
      bathrooms: json['bathrooms'] as int?,
      kitchens: json['kitchens'] as int?,
      isFeatured: json['is_featured'] as bool?,
      salesCount: json['sales_count'] as int?,
      rate: json['rate'] as dynamic,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      address: json['address'] as String?,
      distanceKm: json['distance_km'] as dynamic,
      distance: json['distance'] as dynamic,
      category: json['category'] == null
          ? null
          : Category.fromId5TitleNewCairoGardenVillaTypeASlugNewCairoGardenVillaTypeA69gsfzDescriptionStandaloneVillaWithPrivateGardenMaidSRoomAndCoveredParkingForThreeCarsGatedCommunityWithClubhousePrice1850000000ListingTypeSaleStatusPublishedBedrooms5Bathrooms4Kitchens2IsFeaturedTrueSalesCount7RateNullLatitude3002Longitude3148Lat3002Lng3148AddressNewCairoFifthSettlementDistanceKmNullDistanceNullCategoryId3NameVillasEstatesSlugVillasEstatesFuuoDescriptionDetachedVillasCompoundsAndLargeHomesSortOrder3ImagesId21UrlHttpsImagesUnsplashComPhoto16134904935767fde63acd811W1000Q80SortOrder0Id22UrlHttpsImagesUnsplashComPhoto1600585154340Be6161a56a0cW1000Q80SortOrder1Id23UrlHttpsImagesUnsplashComPhoto160056675319017fb0baa4869W1000Q80SortOrder2Id24UrlHttpsImagesUnsplashComPhoto1600585154526990dced4db0dW1000Q80SortOrder3Id25UrlHttpsImagesUnsplashComPhoto1600607687939Ce8a6c25118cW1000Q80SortOrder4AgentNull(
              json['category'] as Map<String, dynamic>,
            ),
      images: (json['images'] as List<dynamic>?)
          ?.map(
            (e) =>
                Image.fromId5TitleNewCairoGardenVillaTypeASlugNewCairoGardenVillaTypeA69gsfzDescriptionStandaloneVillaWithPrivateGardenMaidSRoomAndCoveredParkingForThreeCarsGatedCommunityWithClubhousePrice1850000000ListingTypeSaleStatusPublishedBedrooms5Bathrooms4Kitchens2IsFeaturedTrueSalesCount7RateNullLatitude3002Longitude3148Lat3002Lng3148AddressNewCairoFifthSettlementDistanceKmNullDistanceNullCategoryId3NameVillasEstatesSlugVillasEstatesFuuoDescriptionDetachedVillasCompoundsAndLargeHomesSortOrder3ImagesId21UrlHttpsImagesUnsplashComPhoto16134904935767fde63acd811W1000Q80SortOrder0Id22UrlHttpsImagesUnsplashComPhoto1600585154340Be6161a56a0cW1000Q80SortOrder1Id23UrlHttpsImagesUnsplashComPhoto160056675319017fb0baa4869W1000Q80SortOrder2Id24UrlHttpsImagesUnsplashComPhoto1600585154526990dced4db0dW1000Q80SortOrder3Id25UrlHttpsImagesUnsplashComPhoto1600607687939Ce8a6c25118cW1000Q80SortOrder4AgentNull(
                  e as Map<String, dynamic>,
                ),
          )
          .toList(),
      agent: json['agent'] as dynamic,
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
