import '../../../data/models/property/category.details.model.dart';

class Category {
  int? id;
  String? name;
  String? slug;
  String? description;
  int? sortOrder;

  Category({this.id, this.name, this.slug, this.description, this.sortOrder});

  factory Category.fromModel(CategoryModel json) {
    return Category(
      id: json.id,
      name: json.name,
      slug: json.slug,
      description: json.description,
      sortOrder: json.sortOrder,
    );
  }

  // Map<String, dynamic>
  // toId6TitleCompoundTwinVillaU2014CornerSlugCompoundTwinVillaCorner03epfmDescriptionTwinVillaOnACornerPlotWithSideGardenRoofTerraceAndSmartHomeWiringPrice1420000000ListingTypeSaleStatusPublishedBedrooms4Bathrooms3Kitchens1IsFeaturedFalseSalesCount2RateNullLatitude3007Longitude3102Lat3007Lng3102AddressSheikhZayedU2014WestCairoDistanceKmNullDistanceNullCategoryId3NameVillasEstatesSlugVillasEstatesFuuoDescriptionDetachedVillasCompoundsAndLargeHomesSortOrder3ImagesId26UrlHttpsImagesUnsplashComPhoto1600585154340Be6161a56a0cW1000Q80SortOrder0Id27UrlHttpsImagesUnsplashComPhoto160056675319017fb0baa4869W1000Q80SortOrder1Id28UrlHttpsImagesUnsplashComPhoto1600585154526990dced4db0dW1000Q80SortOrder2Id29UrlHttpsImagesUnsplashComPhoto1600607687939Ce8a6c25118cW1000Q80SortOrder3Id30UrlHttpsImagesUnsplashComPhoto160056675235535792bedcfeaW1000Q80SortOrder4AgentId2TitleLuxuryNewCairoLeadBioVillasCompoundsAndHighNetWorthRelocationsLicenseNumberNullCompanyDemoRealtyUserId4NameSaraElMasryEmailAgent2ExampleComRoleAgentCreatedAt20260503T133011000000Z() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'slug': slug,
  //     'description': description,
  //     'sort_order': sortOrder,
  //   };
  // }
}
