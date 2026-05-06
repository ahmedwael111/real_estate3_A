import 'package:equatable/equatable.dart';
import '../../../Home/domain/entities/property_cardEntity.dart';

class FavoriteEntity extends Equatable {
  final int id; // favorite record id
  final PropertyCardEntity property;

  const FavoriteEntity({
    required this.id,
    required this.property,
  });

  @override
  List<Object?> get props => [id, property];
}