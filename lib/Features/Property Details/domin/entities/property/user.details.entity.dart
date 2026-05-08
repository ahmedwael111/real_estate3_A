import '../../../data/models/property/user.details.model.dart';

class UserEntity {
  int? id;
  String? name;
  String? email;
  String? role;
  dynamic location;
  dynamic phone;
  DateTime? createdAt;
  String? image;

  UserEntity({
    this.id,
    this.name,
    this.email,
    this.role,
    this.location,
    this.phone,
    this.createdAt,
    this.image,
  });

  factory UserEntity.fromModel(UserModel json) {
    return UserEntity(
      id: json.id,
      name: json.name,
      email: json.email,
      role: json.role,
      location: json.location,
      phone: json.phone,
      createdAt: json.createdAt,
      image: json.image,
    );
  }

  Map<String, dynamic>
  toId6TitleCompoundTwinVillaU2014CornerSlugCompoundTwinVillaCorner03epfmDescriptionTwinVillaOnACornerPlotWithSideGardenRoofTerraceAndSmartHomeWiringPrice1420000000ListingTypeSaleStatusPublishedBedrooms4Bathrooms3Kitchens1IsFeaturedFalseSalesCount2RateNullLatitude3007Longitude3102Lat3007Lng3102AddressSheikhZayedU2014WestCairoDistanceKmNullDistanceNullCategoryId3NameVillasEstatesSlugVillasEstatesFuuoDescriptionDetachedVillasCompoundsAndLargeHomesSortOrder3ImagesId26UrlHttpsImagesUnsplashComPhoto1600585154340Be6161a56a0cW1000Q80SortOrder0Id27UrlHttpsImagesUnsplashComPhoto160056675319017fb0baa4869W1000Q80SortOrder1Id28UrlHttpsImagesUnsplashComPhoto1600585154526990dced4db0dW1000Q80SortOrder2Id29UrlHttpsImagesUnsplashComPhoto1600607687939Ce8a6c25118cW1000Q80SortOrder3Id30UrlHttpsImagesUnsplashComPhoto160056675235535792bedcfeaW1000Q80SortOrder4AgentId2TitleLuxuryNewCairoLeadBioVillasCompoundsAndHighNetWorthRelocationsLicenseNumberNullCompanyDemoRealtyUserId4NameSaraElMasryEmailAgent2ExampleComRoleAgentCreatedAt20260503T133011000000Z() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'created_at': createdAt?.toIso8601String(),
    };
  }
}
