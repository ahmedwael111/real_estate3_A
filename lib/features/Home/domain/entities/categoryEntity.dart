import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int id;
  final String name;
  final String slug;
  final String description;
  final int sortOrder;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.sortOrder,
  });

  @override
  List<Object?> get props => [id, name, slug, description, sortOrder];
}
 