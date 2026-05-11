import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entities/favoriteEntity.dart';
import '../../cubit/favorite_cubit.dart';
import '../../cubit/favorite_state.dart';
import 'FavoriteCategoryGridCard.dart';
import 'FavoriteError.dart';
import 'favorite_Empty.dart';
import 'favorite_category.dart';


class FavoriteContent extends StatelessWidget {
  const FavoriteContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xFF2EC4B6)),
          );
        }

        if (state is FavoriteErrorWidget) {
          return FavoriteError(message: state.message);
        }

        final favorites = _getFavorites(state);

        if (favorites.isEmpty) {
          return const FavoriteEmpty();
        }

        final grouped = _groupByCategory(favorites);

        return RefreshIndicator(
          color: const Color(0xFF2EC4B6),
          onRefresh: () => context.read<FavoriteCubit>().getFavorites(),
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 14.w,
              mainAxisSpacing: 14.h,
              childAspectRatio: 0.85,
            ),
            itemCount: grouped.keys.length,
            itemBuilder: (_, i) {
              final categoryName = grouped.keys.elementAt(i);
              final items = grouped[categoryName]!;

              return FavoriteCategoryGridCard(
                categoryName: categoryName,
                items: items,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: context.read<FavoriteCubit>(),
                      child: FavoriteCategoryDetail(
                        categoryName: categoryName,
                        items: items,
                      ),
                    ),
                  ),
                ),
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