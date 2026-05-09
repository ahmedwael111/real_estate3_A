import 'package:real_estate3_a/Features/Property%20Details/data/models/similar/image.property.dart';

class Image {
  int? id;
  String? url;
  int? sortOrder;

  Image({this.id, this.url, this.sortOrder});

  factory Image.fromModel(ImageSimilarModel json) {
    return Image(id: json.id, url: json.url, sortOrder: json.sortOrder);
  }

  Map<String, dynamic>
  toId5TitleNewCairoGardenVillaTypeASlugNewCairoGardenVillaTypeA69gsfzDescriptionStandaloneVillaWithPrivateGardenMaidSRoomAndCoveredParkingForThreeCarsGatedCommunityWithClubhousePrice1850000000ListingTypeSaleStatusPublishedBedrooms5Bathrooms4Kitchens2IsFeaturedTrueSalesCount7RateNullLatitude3002Longitude3148Lat3002Lng3148AddressNewCairoFifthSettlementDistanceKmNullDistanceNullCategoryId3NameVillasEstatesSlugVillasEstatesFuuoDescriptionDetachedVillasCompoundsAndLargeHomesSortOrder3ImagesId21UrlHttpsImagesUnsplashComPhoto16134904935767fde63acd811W1000Q80SortOrder0Id22UrlHttpsImagesUnsplashComPhoto1600585154340Be6161a56a0cW1000Q80SortOrder1Id23UrlHttpsImagesUnsplashComPhoto160056675319017fb0baa4869W1000Q80SortOrder2Id24UrlHttpsImagesUnsplashComPhoto1600585154526990dced4db0dW1000Q80SortOrder3Id25UrlHttpsImagesUnsplashComPhoto1600607687939Ce8a6c25118cW1000Q80SortOrder4AgentNull() {
    return {'id': id, 'url': url, 'sort_order': sortOrder};
  }
}
