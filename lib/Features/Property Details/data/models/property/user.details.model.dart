class UserModel {
  int? id;
  String? name;
  String? email;
  String? role;
  dynamic location;
  dynamic phone;
  DateTime? createdAt;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.role,
    this.location,
    this.phone,
    this.createdAt,
  });

  factory UserModel.fromDataId2TitleWaterfrontRentalSlugWaterfrontRentalKtbqhhDescriptionFullyFurnishedRentalWithNileOutlooksConciergeAndGymAccessFlexibleLeaseTermsPrice250000ListingTypeRentStatusPublishedBedrooms3Bathrooms2Kitchens1IsFeaturedFalseSalesCount12RateNullLatitude30052Longitude3124Lat30052Lng3124AddressZamalekU2014WaterfrontStripDistanceKmNullDistanceNullCategoryId1NameResidentialSlugResidentialHpxjDescriptionApartmentsFamilyHomesAndUrbanLivingSortOrder1ImagesId6UrlHttpsImagesUnsplashComPhoto15026722602661c1ef2d93688W1000Q80SortOrder0Id7UrlHttpsImagesUnsplashComPhoto1560448204E02f11c3d0e2W1000Q80SortOrder1Id8UrlHttpsImagesUnsplashComPhoto1554995207C18c203602cbW1000Q80SortOrder2Id9UrlHttpsImagesUnsplashComPhoto158602349212527b2c045efd7W1000Q80SortOrder3Id10UrlHttpsImagesUnsplashComPhoto153637607226138c75010e6c9W1000Q80SortOrder4AgentId2TitleLuxuryNewCairoLeadBioVillasCompoundsAndHighNetWorthRelocationsLicenseNumberNullCompanyDemoRealtyUserId4NameSaraElMasryEmailAgent2ExampleComRoleAgentLocationNullPhoneNullCreatedAt20260503T133011000000Z(
    Map<String, dynamic> json,
  ) {
    return UserModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      role: json['role'] as String?,
      location: json['location'] as dynamic,
      phone: json['phone'] as dynamic,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic>
  toDataId2TitleWaterfrontRentalSlugWaterfrontRentalKtbqhhDescriptionFullyFurnishedRentalWithNileOutlooksConciergeAndGymAccessFlexibleLeaseTermsPrice250000ListingTypeRentStatusPublishedBedrooms3Bathrooms2Kitchens1IsFeaturedFalseSalesCount12RateNullLatitude30052Longitude3124Lat30052Lng3124AddressZamalekU2014WaterfrontStripDistanceKmNullDistanceNullCategoryId1NameResidentialSlugResidentialHpxjDescriptionApartmentsFamilyHomesAndUrbanLivingSortOrder1ImagesId6UrlHttpsImagesUnsplashComPhoto15026722602661c1ef2d93688W1000Q80SortOrder0Id7UrlHttpsImagesUnsplashComPhoto1560448204E02f11c3d0e2W1000Q80SortOrder1Id8UrlHttpsImagesUnsplashComPhoto1554995207C18c203602cbW1000Q80SortOrder2Id9UrlHttpsImagesUnsplashComPhoto158602349212527b2c045efd7W1000Q80SortOrder3Id10UrlHttpsImagesUnsplashComPhoto153637607226138c75010e6c9W1000Q80SortOrder4AgentId2TitleLuxuryNewCairoLeadBioVillasCompoundsAndHighNetWorthRelocationsLicenseNumberNullCompanyDemoRealtyUserId4NameSaraElMasryEmailAgent2ExampleComRoleAgentLocationNullPhoneNullCreatedAt20260503T133011000000Z() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'location': location,
      'phone': phone,
      'created_at': createdAt?.toIso8601String(),
    };
  }
}
