import 'agent.details.model.dart';
import 'category.details.model.dart';
import 'image.details.model.dart';

class PropertyDetailsModel {
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
  CategoryModel? category;
  List<ImageModel>? images;
  AgentModell? agent;

  PropertyDetailsModel({
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

  factory PropertyDetailsModel.fromJson(Map<String, dynamic> json) {
    return PropertyDetailsModel(
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
          : CategoryModel.fromDataId2TitleWaterfrontRentalSlugWaterfrontRentalKtbqhhDescriptionFullyFurnishedRentalWithNileOutlooksConciergeAndGymAccessFlexibleLeaseTermsPrice250000ListingTypeRentStatusPublishedBedrooms3Bathrooms2Kitchens1IsFeaturedFalseSalesCount12RateNullLatitude30052Longitude3124Lat30052Lng3124AddressZamalekU2014WaterfrontStripDistanceKmNullDistanceNullCategoryId1NameResidentialSlugResidentialHpxjDescriptionApartmentsFamilyHomesAndUrbanLivingSortOrder1ImagesId6UrlHttpsImagesUnsplashComPhoto15026722602661c1ef2d93688W1000Q80SortOrder0Id7UrlHttpsImagesUnsplashComPhoto1560448204E02f11c3d0e2W1000Q80SortOrder1Id8UrlHttpsImagesUnsplashComPhoto1554995207C18c203602cbW1000Q80SortOrder2Id9UrlHttpsImagesUnsplashComPhoto158602349212527b2c045efd7W1000Q80SortOrder3Id10UrlHttpsImagesUnsplashComPhoto153637607226138c75010e6c9W1000Q80SortOrder4AgentId2TitleLuxuryNewCairoLeadBioVillasCompoundsAndHighNetWorthRelocationsLicenseNumberNullCompanyDemoRealtyUserId4NameSaraElMasryEmailAgent2ExampleComRoleAgentLocationNullPhoneNullCreatedAt20260503T133011000000Z(
              json['category'] as Map<String, dynamic>,
            ),
      images: (json['images'] as List<dynamic>?)
          ?.map(
            (e) =>
                ImageModel.fromDataId2TitleWaterfrontRentalSlugWaterfrontRentalKtbqhhDescriptionFullyFurnishedRentalWithNileOutlooksConciergeAndGymAccessFlexibleLeaseTermsPrice250000ListingTypeRentStatusPublishedBedrooms3Bathrooms2Kitchens1IsFeaturedFalseSalesCount12RateNullLatitude30052Longitude3124Lat30052Lng3124AddressZamalekU2014WaterfrontStripDistanceKmNullDistanceNullCategoryId1NameResidentialSlugResidentialHpxjDescriptionApartmentsFamilyHomesAndUrbanLivingSortOrder1ImagesId6UrlHttpsImagesUnsplashComPhoto15026722602661c1ef2d93688W1000Q80SortOrder0Id7UrlHttpsImagesUnsplashComPhoto1560448204E02f11c3d0e2W1000Q80SortOrder1Id8UrlHttpsImagesUnsplashComPhoto1554995207C18c203602cbW1000Q80SortOrder2Id9UrlHttpsImagesUnsplashComPhoto158602349212527b2c045efd7W1000Q80SortOrder3Id10UrlHttpsImagesUnsplashComPhoto153637607226138c75010e6c9W1000Q80SortOrder4AgentId2TitleLuxuryNewCairoLeadBioVillasCompoundsAndHighNetWorthRelocationsLicenseNumberNullCompanyDemoRealtyUserId4NameSaraElMasryEmailAgent2ExampleComRoleAgentLocationNullPhoneNullCreatedAt20260503T133011000000Z(
                  e as Map<String, dynamic>,
                ),
          )
          .toList(),
      agent: json['agent'] == null
          ? null
          : AgentModell.fromDataId2TitleWaterfrontRentalSlugWaterfrontRentalKtbqhhDescriptionFullyFurnishedRentalWithNileOutlooksConciergeAndGymAccessFlexibleLeaseTermsPrice250000ListingTypeRentStatusPublishedBedrooms3Bathrooms2Kitchens1IsFeaturedFalseSalesCount12RateNullLatitude30052Longitude3124Lat30052Lng3124AddressZamalekU2014WaterfrontStripDistanceKmNullDistanceNullCategoryId1NameResidentialSlugResidentialHpxjDescriptionApartmentsFamilyHomesAndUrbanLivingSortOrder1ImagesId6UrlHttpsImagesUnsplashComPhoto15026722602661c1ef2d93688W1000Q80SortOrder0Id7UrlHttpsImagesUnsplashComPhoto1560448204E02f11c3d0e2W1000Q80SortOrder1Id8UrlHttpsImagesUnsplashComPhoto1554995207C18c203602cbW1000Q80SortOrder2Id9UrlHttpsImagesUnsplashComPhoto158602349212527b2c045efd7W1000Q80SortOrder3Id10UrlHttpsImagesUnsplashComPhoto153637607226138c75010e6c9W1000Q80SortOrder4AgentId2TitleLuxuryNewCairoLeadBioVillasCompoundsAndHighNetWorthRelocationsLicenseNumberNullCompanyDemoRealtyUserId4NameSaraElMasryEmailAgent2ExampleComRoleAgentLocationNullPhoneNullCreatedAt20260503T133011000000Z(
              json['agent'] as Map<String, dynamic>,
            ),
    );
  }

  Map<String, dynamic>
  toDataId2TitleWaterfrontRentalSlugWaterfrontRentalKtbqhhDescriptionFullyFurnishedRentalWithNileOutlooksConciergeAndGymAccessFlexibleLeaseTermsPrice250000ListingTypeRentStatusPublishedBedrooms3Bathrooms2Kitchens1IsFeaturedFalseSalesCount12RateNullLatitude30052Longitude3124Lat30052Lng3124AddressZamalekU2014WaterfrontStripDistanceKmNullDistanceNullCategoryId1NameResidentialSlugResidentialHpxjDescriptionApartmentsFamilyHomesAndUrbanLivingSortOrder1ImagesId6UrlHttpsImagesUnsplashComPhoto15026722602661c1ef2d93688W1000Q80SortOrder0Id7UrlHttpsImagesUnsplashComPhoto1560448204E02f11c3d0e2W1000Q80SortOrder1Id8UrlHttpsImagesUnsplashComPhoto1554995207C18c203602cbW1000Q80SortOrder2Id9UrlHttpsImagesUnsplashComPhoto158602349212527b2c045efd7W1000Q80SortOrder3Id10UrlHttpsImagesUnsplashComPhoto153637607226138c75010e6c9W1000Q80SortOrder4AgentId2TitleLuxuryNewCairoLeadBioVillasCompoundsAndHighNetWorthRelocationsLicenseNumberNullCompanyDemoRealtyUserId4NameSaraElMasryEmailAgent2ExampleComRoleAgentLocationNullPhoneNullCreatedAt20260503T133011000000Z() {
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
          ?.toDataId2TitleWaterfrontRentalSlugWaterfrontRentalKtbqhhDescriptionFullyFurnishedRentalWithNileOutlooksConciergeAndGymAccessFlexibleLeaseTermsPrice250000ListingTypeRentStatusPublishedBedrooms3Bathrooms2Kitchens1IsFeaturedFalseSalesCount12RateNullLatitude30052Longitude3124Lat30052Lng3124AddressZamalekU2014WaterfrontStripDistanceKmNullDistanceNullCategoryId1NameResidentialSlugResidentialHpxjDescriptionApartmentsFamilyHomesAndUrbanLivingSortOrder1ImagesId6UrlHttpsImagesUnsplashComPhoto15026722602661c1ef2d93688W1000Q80SortOrder0Id7UrlHttpsImagesUnsplashComPhoto1560448204E02f11c3d0e2W1000Q80SortOrder1Id8UrlHttpsImagesUnsplashComPhoto1554995207C18c203602cbW1000Q80SortOrder2Id9UrlHttpsImagesUnsplashComPhoto158602349212527b2c045efd7W1000Q80SortOrder3Id10UrlHttpsImagesUnsplashComPhoto153637607226138c75010e6c9W1000Q80SortOrder4AgentId2TitleLuxuryNewCairoLeadBioVillasCompoundsAndHighNetWorthRelocationsLicenseNumberNullCompanyDemoRealtyUserId4NameSaraElMasryEmailAgent2ExampleComRoleAgentLocationNullPhoneNullCreatedAt20260503T133011000000Z(),
      'images': images
          ?.map(
            (e) => e
                .toDataId2TitleWaterfrontRentalSlugWaterfrontRentalKtbqhhDescriptionFullyFurnishedRentalWithNileOutlooksConciergeAndGymAccessFlexibleLeaseTermsPrice250000ListingTypeRentStatusPublishedBedrooms3Bathrooms2Kitchens1IsFeaturedFalseSalesCount12RateNullLatitude30052Longitude3124Lat30052Lng3124AddressZamalekU2014WaterfrontStripDistanceKmNullDistanceNullCategoryId1NameResidentialSlugResidentialHpxjDescriptionApartmentsFamilyHomesAndUrbanLivingSortOrder1ImagesId6UrlHttpsImagesUnsplashComPhoto15026722602661c1ef2d93688W1000Q80SortOrder0Id7UrlHttpsImagesUnsplashComPhoto1560448204E02f11c3d0e2W1000Q80SortOrder1Id8UrlHttpsImagesUnsplashComPhoto1554995207C18c203602cbW1000Q80SortOrder2Id9UrlHttpsImagesUnsplashComPhoto158602349212527b2c045efd7W1000Q80SortOrder3Id10UrlHttpsImagesUnsplashComPhoto153637607226138c75010e6c9W1000Q80SortOrder4AgentId2TitleLuxuryNewCairoLeadBioVillasCompoundsAndHighNetWorthRelocationsLicenseNumberNullCompanyDemoRealtyUserId4NameSaraElMasryEmailAgent2ExampleComRoleAgentLocationNullPhoneNullCreatedAt20260503T133011000000Z(),
          )
          .toList(),
      'agent': agent
          ?.toDataId2TitleWaterfrontRentalSlugWaterfrontRentalKtbqhhDescriptionFullyFurnishedRentalWithNileOutlooksConciergeAndGymAccessFlexibleLeaseTermsPrice250000ListingTypeRentStatusPublishedBedrooms3Bathrooms2Kitchens1IsFeaturedFalseSalesCount12RateNullLatitude30052Longitude3124Lat30052Lng3124AddressZamalekU2014WaterfrontStripDistanceKmNullDistanceNullCategoryId1NameResidentialSlugResidentialHpxjDescriptionApartmentsFamilyHomesAndUrbanLivingSortOrder1ImagesId6UrlHttpsImagesUnsplashComPhoto15026722602661c1ef2d93688W1000Q80SortOrder0Id7UrlHttpsImagesUnsplashComPhoto1560448204E02f11c3d0e2W1000Q80SortOrder1Id8UrlHttpsImagesUnsplashComPhoto1554995207C18c203602cbW1000Q80SortOrder2Id9UrlHttpsImagesUnsplashComPhoto158602349212527b2c045efd7W1000Q80SortOrder3Id10UrlHttpsImagesUnsplashComPhoto153637607226138c75010e6c9W1000Q80SortOrder4AgentId2TitleLuxuryNewCairoLeadBioVillasCompoundsAndHighNetWorthRelocationsLicenseNumberNullCompanyDemoRealtyUserId4NameSaraElMasryEmailAgent2ExampleComRoleAgentLocationNullPhoneNullCreatedAt20260503T133011000000Z(),
    };
  }
}
