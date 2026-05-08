import '../../../data/models/property/agent.details.model.dart';
import 'user.details.entity.dart';

class Agent {
  int? id;
  String? title;
  String? bio;
  dynamic licenseNumber;
  String? company;
  User? user;

  Agent({
    this.id,
    this.title,
    this.bio,
    this.licenseNumber,
    this.company,
    this.user,
  });

  factory Agent.fromModel(AgentModell json) {
    return Agent(
      id: json.id,
      title: json.title,
      bio: json.bio,
      licenseNumber: json.licenseNumber,
      company: json.company,
      user: json.user != null ? User.fromModel(json.user!) : null,
    );
  }

  // Map<String, dynamic>
  // toId6TitleCompoundTwinVillaU2014CornerSlugCompoundTwinVillaCorner03epfmDescriptionTwinVillaOnACornerPlotWithSideGardenRoofTerraceAndSmartHomeWiringPrice1420000000ListingTypeSaleStatusPublishedBedrooms4Bathrooms3Kitchens1IsFeaturedFalseSalesCount2RateNullLatitude3007Longitude3102Lat3007Lng3102AddressSheikhZayedU2014WestCairoDistanceKmNullDistanceNullCategoryId3NameVillasEstatesSlugVillasEstatesFuuoDescriptionDetachedVillasCompoundsAndLargeHomesSortOrder3ImagesId26UrlHttpsImagesUnsplashComPhoto1600585154340Be6161a56a0cW1000Q80SortOrder0Id27UrlHttpsImagesUnsplashComPhoto160056675319017fb0baa4869W1000Q80SortOrder1Id28UrlHttpsImagesUnsplashComPhoto1600585154526990dced4db0dW1000Q80SortOrder2Id29UrlHttpsImagesUnsplashComPhoto1600607687939Ce8a6c25118cW1000Q80SortOrder3Id30UrlHttpsImagesUnsplashComPhoto160056675235535792bedcfeaW1000Q80SortOrder4AgentId2TitleLuxuryNewCairoLeadBioVillasCompoundsAndHighNetWorthRelocationsLicenseNumberNullCompanyDemoRealtyUserId4NameSaraElMasryEmailAgent2ExampleComRoleAgentCreatedAt20260503T133011000000Z() {
  //   return {
  //     'id': id,
  //     'title': title,
  //     'bio': bio,
  //     'license_number': licenseNumber,
  //     'company': company,
  //     'user': user
  //         ?.toId6TitleCompoundTwinVillaU2014CornerSlugCompoundTwinVillaCorner03epfmDescriptionTwinVillaOnACornerPlotWithSideGardenRoofTerraceAndSmartHomeWiringPrice1420000000ListingTypeSaleStatusPublishedBedrooms4Bathrooms3Kitchens1IsFeaturedFalseSalesCount2RateNullLatitude3007Longitude3102Lat3007Lng3102AddressSheikhZayedU2014WestCairoDistanceKmNullDistanceNullCategoryId3NameVillasEstatesSlugVillasEstatesFuuoDescriptionDetachedVillasCompoundsAndLargeHomesSortOrder3ImagesId26UrlHttpsImagesUnsplashComPhoto1600585154340Be6161a56a0cW1000Q80SortOrder0Id27UrlHttpsImagesUnsplashComPhoto160056675319017fb0baa4869W1000Q80SortOrder1Id28UrlHttpsImagesUnsplashComPhoto1600585154526990dced4db0dW1000Q80SortOrder2Id29UrlHttpsImagesUnsplashComPhoto1600607687939Ce8a6c25118cW1000Q80SortOrder3Id30UrlHttpsImagesUnsplashComPhoto160056675235535792bedcfeaW1000Q80SortOrder4AgentId2TitleLuxuryNewCairoLeadBioVillasCompoundsAndHighNetWorthRelocationsLicenseNumberNullCompanyDemoRealtyUserId4NameSaraElMasryEmailAgent2ExampleComRoleAgentCreatedAt20260503T133011000000Z(),
  //   };
  // }
}
