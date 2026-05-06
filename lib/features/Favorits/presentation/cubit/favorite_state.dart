import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart'; // listEquals, setEquals
import '../../domain/entities/favoriteEntity.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object?> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<FavoriteEntity> favorites;
  final Set<int> favoriteIds;

  const FavoriteLoaded({
    required this.favorites,
    required this.favoriteIds,
  });

  // ✅ مقارنة صح للـ collections
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FavoriteLoaded &&
        listEquals(favorites, other.favorites) &&
        setEquals(favoriteIds, other.favoriteIds);
  }

  @override
  int get hashCode => Object.hash(
    Object.hashAll(favorites),
    Object.hashAll(favoriteIds),
  );

  @override
  List<Object?> get props => [];
}

class FavoriteErrorWidget  extends FavoriteState {
  final String message;
  const FavoriteErrorWidget ({required this.message});

  @override
  List<Object?> get props => [message];
}

class FavoriteActionLoading extends FavoriteState {
  final List<FavoriteEntity> favorites;
  final Set<int> favoriteIds;
  final int loadingPropertyId;

  const FavoriteActionLoading({
    required this.favorites,
    required this.favoriteIds,
    required this.loadingPropertyId,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FavoriteActionLoading &&
        loadingPropertyId == other.loadingPropertyId &&
        setEquals(favoriteIds, other.favoriteIds) &&
        listEquals(favorites, other.favorites);
  }

  @override
  int get hashCode => Object.hash(
    loadingPropertyId,
    Object.hashAll(favoriteIds),
    Object.hashAll(favorites),
  );

  @override
  List<Object?> get props => [];
}