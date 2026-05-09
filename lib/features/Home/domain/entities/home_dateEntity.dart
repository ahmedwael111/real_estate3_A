import 'package:equatable/equatable.dart';
import 'package:real_estate3_a/features/Home/domain/entities/property_cardEntity.dart';

import 'categoryEntity.dart';

class HomeDataEntity extends Equatable {
  final List<CategoryEntity> categories;
  final List<PropertyCardEntity> bestSelling;
  final List<PropertyCardEntity> featured;
  final List<PropertyCardEntity> recommended;

  const HomeDataEntity({
    required this.categories,
    required this.bestSelling,
    required this.featured,
    required this.recommended,
  });

  @override
  List<Object?> get props => [categories, bestSelling, featured, recommended];
}
