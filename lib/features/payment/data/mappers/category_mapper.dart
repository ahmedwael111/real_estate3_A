import 'package:real_estate3_a/features/payment/data/models/category_model.dart';
import 'package:real_estate3_a/features/payment/domain/entities/category_entity.dart';

extension CategoryModelExtension on CategoryModel {
  CategoryEntity get toEntity => this;
}
