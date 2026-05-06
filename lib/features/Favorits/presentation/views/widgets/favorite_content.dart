
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/favoriteEntity.dart';
import '../../cubit/favorite_cubit.dart';
import '../../cubit/favorite_state.dart';
import 'FavoriteError.dart';
import 'favorite_Empty.dart';
import 'favorite_section.dart';

class FavoriteContent extends StatelessWidget {
  const FavoriteContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xFF2EC4B6)),
          );
        }

        if (state is FavoriteErrorWidget ) {
          return FavoriteError(message: state.message);
        }

        final favorites = _getFavorites(state);

        if (favorites.isEmpty) {
          return const FavoriteEmpty();
        }

        final grouped = _groupByCategory(favorites);

        return RefreshIndicator(
          onRefresh: () =>
              context.read<FavoriteCubit>().getFavorites(),
          child: ListView.builder(
            itemCount: grouped.keys.length,
            itemBuilder: (_, i) {
              final key = grouped.keys.elementAt(i);
              return FavoriteSection(
                categoryName: key,
                items: grouped[key]!,
                state: state,
              );
            },
          ),
        );
      },
    );
  }
  Map<String, List<FavoriteEntity>> _groupByCategory(
      List<FavoriteEntity> favorites) {
    final map = <String, List<FavoriteEntity>>{};
    for (var fav in favorites) {
      final key = fav.property.category.name;
      map.putIfAbsent(key, () => []).add(fav);
    }
    return map;
  }

  List<FavoriteEntity> _getFavorites(FavoriteState state) {
    if (state is FavoriteLoaded) return state.favorites;
    if (state is FavoriteActionLoading) return state.favorites;
    return [];
  }
}