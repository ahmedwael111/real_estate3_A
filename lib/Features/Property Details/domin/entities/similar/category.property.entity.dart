import 'package:real_estate3_a/Features/Property%20Details/data/models/similar/category.property.dart';

class Category {
  int? id;
  String? name;
  String? slug;
  String? description;
  int? sortOrder;

  Category({this.id, this.name, this.slug, this.description, this.sortOrder});

  factory Category.fromModel(CategorySimilarModel json) {
    return Category(
      id: json.id,
      name: json.name,
      slug: json.slug,
      description: json.description,
      sortOrder: json.sortOrder,
    );
  }

  Map<String, dynamic>
  toId5TitleNewCairoGardenVillaTypeASlugNewCairoGardenVillaTypeA69gsfzDescriptionStandaloneVillaWithPrivateGardenMaidSRoomAndCoveredParkingForThreeCarsGatedCommunityWithClubhousePrice1850000000ListingTypeSaleStatusPublishedBedrooms5Bathrooms4Kitchens2IsFeaturedTrueSalesCount7RateNullLatitude3002Longitude3148Lat3002Lng3148AddressNewCairoFifthSettlementDistanceKmNullDistanceNullCategoryId3NameVillasEstatesSlugVillasEstatesFuuoDescriptionDetachedVillasCompoundsAndLargeHomesSortOrder3ImagesId21UrlHttpsImagesUnsplashComPhoto16134904935767fde63acd811W1000Q80SortOrder0Id22UrlHttpsImagesUnsplashComPhoto1600585154340Be6161a56a0cW1000Q80SortOrder1Id23UrlHttpsImagesUnsplashComPhoto160056675319017fb0baa4869W1000Q80SortOrder2Id24UrlHttpsImagesUnsplashComPhoto1600585154526990dced4db0dW1000Q80SortOrder3Id25UrlHttpsImagesUnsplashComPhoto1600607687939Ce8a6c25118cW1000Q80SortOrder4AgentNull() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'description': description,
      'sort_order': sortOrder,
    };
  }
}
