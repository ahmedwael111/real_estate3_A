import 'package:real_estate3_a/features/Home/data/models/propertyCardModel.dart';

import '../../domain/entities/home_dateEntity.dart';
import 'categoryModel.dart';

class HomeDataModel {
  final List<CategoryModel> categories;
  final List<PropertyCardModel> bestSelling;
  final List<PropertyCardModel> featured;
  final List<PropertyCardModel> recommended;

  const HomeDataModel({
    required this.categories,
    required this.bestSelling,
    required this.featured,
    required this.recommended,
  });

  factory HomeDataModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>;

    return HomeDataModel(
      categories: (data['categories'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      bestSelling: (data['best_selling'] as List<dynamic>)
          .map((e) => PropertyCardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      featured: (data['featured'] as List<dynamic>)
          .map((e) => PropertyCardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      recommended: (data['recommended'] as List<dynamic>)
          .map((e) => PropertyCardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  HomeDataEntity toEntity() => HomeDataEntity(
    categories: categories.map((e) => e.toEntity()).toList(),
    bestSelling: bestSelling.map((e) => e.toEntity()).toList(),
    featured: featured.map((e) => e.toEntity()).toList(),
    recommended: recommended.map((e) => e.toEntity()).toList(),
  );
}
