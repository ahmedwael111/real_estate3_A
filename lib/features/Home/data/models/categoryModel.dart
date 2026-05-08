import '../../domain/entities/categoryEntity.dart';

class CategoryModel {
  final int id;
  final String name;
  final String slug;
  final String description;
  final int sortOrder;


  const CategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.sortOrder,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json['id'] ?? 0,
    name: json['name']?.toString() ?? '',
    slug: json['slug']?.toString() ?? '',
    description: json['description']?.toString() ?? '',
    sortOrder: json['sort_order'] ?? 0,
  );

  CategoryEntity toEntity() => CategoryEntity(

    id: id,
    name: name,
    slug: slug,
    description: description,
    sortOrder: sortOrder,
  );
}
