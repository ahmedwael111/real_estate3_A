
import '../../../Home/data/models/propertyCardModel.dart';
import '../../domain/entities/favoriteEntity.dart';

class FavoriteModel {
  final int id;
  final PropertyCardModel property;

  const FavoriteModel({
    required this.id,
    required this.property,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      id: json['id'] as int,
      property:  PropertyCardModel.fromJson(json),
    );
  }

  FavoriteEntity toEntity() => FavoriteEntity(
    id: id,
    property: property.toEntity(),
  );
}

class FavoriteListModel {
  final List<FavoriteModel> data;

  FavoriteListModel({required this.data});

  factory FavoriteListModel.fromJson(Map<String, dynamic> json) {
    final list = json['data'] as List? ?? [];

    return FavoriteListModel(
      data: list.map((e) => FavoriteModel.fromJson(e)).toList(),
    );
  }


  List<FavoriteEntity> toEntity() {
    return data.map((e) => e.toEntity()).toList();
  }
}extension FavoriteListMapper on FavoriteListModel {
  List<FavoriteEntity> toEntity() {
    return data.map((e) => e.toEntity()).toList();
  }
}
