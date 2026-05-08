import 'package:real_estate3_a/Features/Property%20Details/data/models/property/propety_details.model.dart';

import 'agent.details.entity.dart';
import 'category.details.entity.dart';
import 'image.details.entity.dart';

class PropertyDetailsEntity {
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
  Agent? agent;

  PropertyDetailsEntity({
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

  factory PropertyDetailsEntity.fromModel(PropertyDetailsModel json) {
    return PropertyDetailsEntity(
      id: json.id,
      title: json.title,
      slug: json.slug,
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
      address: json.address,
      distanceKm: json.distanceKm,
      distance: json.distance,
      category: json.category != null
          ? Category.fromModel(json.category!)
          : null,
      images: (json.images as List?)?.map((e) => Image.fromModel(e)).toList(),
      agent: json.agent != null ? Agent.fromModel(json.agent!) : null,
    );
  }

  // Map<String, dynamic>
  // toId6TitleCompoundTwinVillaU2014CornerSlugCompoundTwinVillaCorner03epfmDescriptionTwinVillaOnACornerPlotWithSideGardenRoofTerraceAndSmartHomeWiringPrice1420000000ListingTypeSaleStatusPublishedBedrooms4Bathrooms3Kitchens1IsFeaturedFalseSalesCount2RateNullLatitude3007Longitude3102Lat3007Lng3102AddressSheikhZayedU2014WestCairoDistanceKmNullDistanceNullCategoryId3NameVillasEstatesSlugVillasEstatesFuuoDescriptionDetachedVillasCompoundsAndLargeHomesSortOrder3ImagesId26UrlHttpsImagesUnsplashComPhoto1600585154340Be6161a56a0cW1000Q80SortOrder0Id27UrlHttpsImagesUnsplashComPhoto160056675319017fb0baa4869W1000Q80SortOrder1Id28UrlHttpsImagesUnsplashComPhoto1600585154526990dced4db0dW1000Q80SortOrder2Id29UrlHttpsImagesUnsplashComPhoto1600607687939Ce8a6c25118cW1000Q80SortOrder3Id30UrlHttpsImagesUnsplashComPhoto160056675235535792bedcfeaW1000Q80SortOrder4AgentId2TitleLuxuryNewCairoLeadBioVillasCompoundsAndHighNetWorthRelocationsLicenseNumberNullCompanyDemoRealtyUserId4NameSaraElMasryEmailAgent2ExampleComRoleAgentCreatedAt20260503T133011000000Z() {
  //   return {
  //     'id': id,
  //     'title': title,
  //     'slug': slug,
  //     'description': description,
  //     'price': price,
  //     'listing_type': listingType,
  //     'status': status,
  //     'bedrooms': bedrooms,
  //     'bathrooms': bathrooms,
  //     'kitchens': kitchens,
  //     'is_featured': isFeatured,
  //     'sales_count': salesCount,
  //     'rate': rate,
  //     'latitude': latitude,
  //     'longitude': longitude,
  //     'lat': lat,
  //     'lng': lng,
  //     'address': address,
  //     'distance_km': distanceKm,
  //     'distance': distance,
  //     'category': category
  //         ?.toId6TitleCompoundTwinVillaU2014CornerSlugCompoundTwinVillaCorner03epfmDescriptionTwinVillaOnACornerPlotWithSideGardenRoofTerraceAndSmartHomeWiringPrice1420000000ListingTypeSaleStatusPublishedBedrooms4Bathrooms3Kitchens1IsFeaturedFalseSalesCount2RateNullLatitude3007Longitude3102Lat3007Lng3102AddressSheikhZayedU2014WestCairoDistanceKmNullDistanceNullCategoryId3NameVillasEstatesSlugVillasEstatesFuuoDescriptionDetachedVillasCompoundsAndLargeHomesSortOrder3ImagesId26UrlHttpsImagesUnsplashComPhoto1600585154340Be6161a56a0cW1000Q80SortOrder0Id27UrlHttpsImagesUnsplashComPhoto160056675319017fb0baa4869W1000Q80SortOrder1Id28UrlHttpsImagesUnsplashComPhoto1600585154526990dced4db0dW1000Q80SortOrder2Id29UrlHttpsImagesUnsplashComPhoto1600607687939Ce8a6c25118cW1000Q80SortOrder3Id30UrlHttpsImagesUnsplashComPhoto160056675235535792bedcfeaW1000Q80SortOrder4AgentId2TitleLuxuryNewCairoLeadBioVillasCompoundsAndHighNetWorthRelocationsLicenseNumberNullCompanyDemoRealtyUserId4NameSaraElMasryEmailAgent2ExampleComRoleAgentCreatedAt20260503T133011000000Z(),
  //     'images': images
  //         ?.map(
  //           (e) => e
  //               .toId6TitleCompoundTwinVillaU2014CornerSlugCompoundTwinVillaCorner03epfmDescriptionTwinVillaOnACornerPlotWithSideGardenRoofTerraceAndSmartHomeWiringPrice1420000000ListingTypeSaleStatusPublishedBedrooms4Bathrooms3Kitchens1IsFeaturedFalseSalesCount2RateNullLatitude3007Longitude3102Lat3007Lng3102AddressSheikhZayedU2014WestCairoDistanceKmNullDistanceNullCategoryId3NameVillasEstatesSlugVillasEstatesFuuoDescriptionDetachedVillasCompoundsAndLargeHomesSortOrder3ImagesId26UrlHttpsImagesUnsplashComPhoto1600585154340Be6161a56a0cW1000Q80SortOrder0Id27UrlHttpsImagesUnsplashComPhoto160056675319017fb0baa4869W1000Q80SortOrder1Id28UrlHttpsImagesUnsplashComPhoto1600585154526990dced4db0dW1000Q80SortOrder2Id29UrlHttpsImagesUnsplashComPhoto1600607687939Ce8a6c25118cW1000Q80SortOrder3Id30UrlHttpsImagesUnsplashComPhoto160056675235535792bedcfeaW1000Q80SortOrder4AgentId2TitleLuxuryNewCairoLeadBioVillasCompoundsAndHighNetWorthRelocationsLicenseNumberNullCompanyDemoRealtyUserId4NameSaraElMasryEmailAgent2ExampleComRoleAgentCreatedAt20260503T133011000000Z(),
  //         )
  //         .toList(),
  //     'agent': agent
  //         ?.toId6TitleCompoundTwinVillaU2014CornerSlugCompoundTwinVillaCorner03epfmDescriptionTwinVillaOnACornerPlotWithSideGardenRoofTerraceAndSmartHomeWiringPrice1420000000ListingTypeSaleStatusPublishedBedrooms4Bathrooms3Kitchens1IsFeaturedFalseSalesCount2RateNullLatitude3007Longitude3102Lat3007Lng3102AddressSheikhZayedU2014WestCairoDistanceKmNullDistanceNullCategoryId3NameVillasEstatesSlugVillasEstatesFuuoDescriptionDetachedVillasCompoundsAndLargeHomesSortOrder3ImagesId26UrlHttpsImagesUnsplashComPhoto1600585154340Be6161a56a0cW1000Q80SortOrder0Id27UrlHttpsImagesUnsplashComPhoto160056675319017fb0baa4869W1000Q80SortOrder1Id28UrlHttpsImagesUnsplashComPhoto1600585154526990dced4db0dW1000Q80SortOrder2Id29UrlHttpsImagesUnsplashComPhoto1600607687939Ce8a6c25118cW1000Q80SortOrder3Id30UrlHttpsImagesUnsplashComPhoto160056675235535792bedcfeaW1000Q80SortOrder4AgentId2TitleLuxuryNewCairoLeadBioVillasCompoundsAndHighNetWorthRelocationsLicenseNumberNullCompanyDemoRealtyUserId4NameSaraElMasryEmailAgent2ExampleComRoleAgentCreatedAt20260503T133011000000Z(),
  //   };
  // }
}
