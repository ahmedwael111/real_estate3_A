import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/favoriteEntity.dart';
import '../../domain/repo/favoriteRepo.dart';
import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepository _repo;

  FavoriteCubit(this._repo) : super(FavoriteInitial());

  Future<void> getFavorites() async {
    emit(FavoriteLoading());

    final result = await _repo.getFavorites();

    result.fold(
      (failure) => emit(FavoriteErrorWidget (message: failure.message)),
      (favorites) => emit(
        FavoriteLoaded(
          favorites: favorites,
          favoriteIds: favorites.map((f) => f.property.id).toSet(),
        ),
      ),
    );
  }

  Future<void> toggleFavorite(int propertyId) async {
    final current = state;

    List<FavoriteEntity> currentList = [];
    Set<int> currentIds = {};

    if (current is FavoriteLoaded) {
      currentList = List.from(current.favorites);
      currentIds = Set.from(current.favoriteIds);
    } else if (current is FavoriteActionLoading) {
      currentList = List.from(current.favorites);
      currentIds = Set.from(current.favoriteIds);
    } else {
      return;
    }

    final isFav = currentIds.contains(propertyId);


    final updatedIds = Set<int>.from(currentIds);
    List<FavoriteEntity> updatedList;

    if (isFav) {
      updatedIds.remove(propertyId);
      updatedList = currentList.where((f) => f.property.id != propertyId).toList();
    } else {
      updatedIds.add(propertyId);
      updatedList = currentList;
    }

    emit(FavoriteActionLoading(
      favorites: updatedList,
      favoriteIds: updatedIds,
      loadingPropertyId: propertyId,
    ));

    if (isFav) {
      final result = await _repo.removeFavorite(propertyId);
      result.fold(
            (failure) => emit(FavoriteLoaded(favorites: currentList, favoriteIds: currentIds)), // rollback
            (_) => emit(FavoriteLoaded(favorites: updatedList, favoriteIds: updatedIds)),
      );
    } else {
      final result = await _repo.addFavorite(propertyId);
      result.fold(
            (failure) => emit(FavoriteLoaded(favorites: currentList, favoriteIds: currentIds)), // rollback
            (_) async {

          final favResult = await _repo.getFavorites();
          favResult.fold(
                (failure) => emit(FavoriteLoaded(favorites: updatedList, favoriteIds: updatedIds)),
                (favorites) => emit(FavoriteLoaded(
              favorites: favorites,
              favoriteIds: favorites.map((f) => f.property.id).toSet(),
            )),
          );
        },
      );
    }
  }

  bool isFavorite(int propertyId) {
    final current = state;
    if (current is FavoriteLoaded)
      return current.favoriteIds.contains(propertyId);
    if (current is FavoriteActionLoading)
      return current.favoriteIds.contains(propertyId);
    return false;
  }
}
