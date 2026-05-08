import 'package:real_estate3_a/Features/Property%20Details/data/models/property/image.details.model.dart';

class Image {
  int? id;
  String? url;
  int? sortOrder;

  Image({this.id, this.url, this.sortOrder});

  factory Image.fromModel(ImageModel json) {
    return Image(id: json.id, url: json.url, sortOrder: json.sortOrder);
  }

  // Map<String, dynamic>
  // toId6TitleCompoundTwinVillaU2014CornerSlugCompoundTwinVillaCorner03epfmDescriptionTwinVillaOnACornerPlotWithSideGardenRoofTerraceAndSmartHomeWiringPrice1420000000ListingTypeSaleStatusPublishedBedrooms4Bathrooms3Kitchens1IsFeaturedFalseSalesCount2RateNullLatitude3007Longitude3102Lat3007Lng3102AddressSheikhZayedU2014WestCairoDistanceKmNullDistanceNullCategoryId3NameVillasEstatesSlugVillasEstatesFuuoDescriptionDetachedVillasCompoundsAndLargeHomesSortOrder3ImagesId26UrlHttpsImagesUnsplashComPhoto1600585154340Be6161a56a0cW1000Q80SortOrder0Id27UrlHttpsImagesUnsplashComPhoto160056675319017fb0baa4869W1000Q80SortOrder1Id28UrlHttpsImagesUnsplashComPhoto1600585154526990dced4db0dW1000Q80SortOrder2Id29UrlHttpsImagesUnsplashComPhoto1600607687939Ce8a6c25118cW1000Q80SortOrder3Id30UrlHttpsImagesUnsplashComPhoto160056675235535792bedcfeaW1000Q80SortOrder4AgentId2TitleLuxuryNewCairoLeadBioVillasCompoundsAndHighNetWorthRelocationsLicenseNumberNullCompanyDemoRealtyUserId4NameSaraElMasryEmailAgent2ExampleComRoleAgentCreatedAt20260503T133011000000Z() {
  //   return {'id': id, 'url': url, 'sort_order': sortOrder};
  // }
}
