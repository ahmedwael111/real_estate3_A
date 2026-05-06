
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Home/presentation/views/widgets/propertyCard.dart';
import '../../../domain/entities/favoriteEntity.dart';
import '../../cubit/favorite_state.dart';

class FavoriteList extends StatelessWidget {
  final List<FavoriteEntity> items;
  final FavoriteState state;

  const FavoriteList({
    super.key,
    required this.items,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (_, __) => SizedBox(height: 14.h),
      itemBuilder: (_, i) {
        final fav = items[i];

        bool isLoading = false;

        if (state is FavoriteActionLoading) {
          final loadingState = state as FavoriteActionLoading;
          isLoading = loadingState.loadingPropertyId == fav.property.id;
        }
        return Stack(
          children: [
            PropertyCard(property: fav.property, isWide: true),
            if (isLoading)
              const Center(child: CircularProgressIndicator()),
          ],
        );
      },
    );
  }
}