class CategoryModel {
  int? id;
  String? name;
  String? slug;
  String? description;
  int? sortOrder;

  CategoryModel({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.sortOrder,
  });

  factory CategoryModel.fromDataId2TitleWaterfrontRentalSlugWaterfrontRentalKtbqhhDescriptionFullyFurnishedRentalWithNileOutlooksConciergeAndGymAccessFlexibleLeaseTermsPrice250000ListingTypeRentStatusPublishedBedrooms3Bathrooms2Kitchens1IsFeaturedFalseSalesCount12RateNullLatitude30052Longitude3124Lat30052Lng3124AddressZamalekU2014WaterfrontStripDistanceKmNullDistanceNullCategoryId1NameResidentialSlugResidentialHpxjDescriptionApartmentsFamilyHomesAndUrbanLivingSortOrder1ImagesId6UrlHttpsImagesUnsplashComPhoto15026722602661c1ef2d93688W1000Q80SortOrder0Id7UrlHttpsImagesUnsplashComPhoto1560448204E02f11c3d0e2W1000Q80SortOrder1Id8UrlHttpsImagesUnsplashComPhoto1554995207C18c203602cbW1000Q80SortOrder2Id9UrlHttpsImagesUnsplashComPhoto158602349212527b2c045efd7W1000Q80SortOrder3Id10UrlHttpsImagesUnsplashComPhoto153637607226138c75010e6c9W1000Q80SortOrder4AgentId2TitleLuxuryNewCairoLeadBioVillasCompoundsAndHighNetWorthRelocationsLicenseNumberNullCompanyDemoRealtyUserId4NameSaraElMasryEmailAgent2ExampleComRoleAgentLocationNullPhoneNullCreatedAt20260503T133011000000Z(
    Map<String, dynamic> json,
  ) {
    return CategoryModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      sortOrder: json['sort_order'] as int?,
    );
  }

  Map<String, dynamic>
  toDataId2TitleWaterfrontRentalSlugWaterfrontRentalKtbqhhDescriptionFullyFurnishedRentalWithNileOutlooksConciergeAndGymAccessFlexibleLeaseTermsPrice250000ListingTypeRentStatusPublishedBedrooms3Bathrooms2Kitchens1IsFeaturedFalseSalesCount12RateNullLatitude30052Longitude3124Lat30052Lng3124AddressZamalekU2014WaterfrontStripDistanceKmNullDistanceNullCategoryId1NameResidentialSlugResidentialHpxjDescriptionApartmentsFamilyHomesAndUrbanLivingSortOrder1ImagesId6UrlHttpsImagesUnsplashComPhoto15026722602661c1ef2d93688W1000Q80SortOrder0Id7UrlHttpsImagesUnsplashComPhoto1560448204E02f11c3d0e2W1000Q80SortOrder1Id8UrlHttpsImagesUnsplashComPhoto1554995207C18c203602cbW1000Q80SortOrder2Id9UrlHttpsImagesUnsplashComPhoto158602349212527b2c045efd7W1000Q80SortOrder3Id10UrlHttpsImagesUnsplashComPhoto153637607226138c75010e6c9W1000Q80SortOrder4AgentId2TitleLuxuryNewCairoLeadBioVillasCompoundsAndHighNetWorthRelocationsLicenseNumberNullCompanyDemoRealtyUserId4NameSaraElMasryEmailAgent2ExampleComRoleAgentLocationNullPhoneNullCreatedAt20260503T133011000000Z() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'description': description,
      'sort_order': sortOrder,
    };
  }
}
