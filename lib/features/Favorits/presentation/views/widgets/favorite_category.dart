import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate3_a/features/Property%20Details/presentaion/property_details_view.dart';

import '../../../../Home/presentation/views/widgets/propertyCard.dart';
import '../../../domain/entities/favoriteEntity.dart';
import '../../cubit/favorite_cubit.dart';
import '../../cubit/favorite_state.dart';

class FavoriteCategoryDetail extends StatelessWidget {
  final String categoryName;
  final List<FavoriteEntity> items;

  const FavoriteCategoryDetail({
    super.key,
    required this.categoryName,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header ──────────────────────────────────────────────
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 40.r,
                      height: 40.r,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.07),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 16.r,
                        color: const Color(0xFF1A1A2E),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Text(
                    categoryName,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF1A1A2E),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${items.length} ${items.length == 1 ? 'property' : 'properties'}',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: const Color(0xFF9CA3AF),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16.h),

            // ── List ────────────────────────────────────────────────
            Expanded(
              child: BlocBuilder<FavoriteCubit, FavoriteState>(
                builder: (context, state) {
                  // جيب الـ items المحدثة من الـ state
                  final updatedFavorites = _getUpdatedItems(state);

                  if (updatedFavorites.isEmpty) {
                    // لو مفيش items في الـ category دي - ارجع
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (context.mounted) Navigator.pop(context);
                    });
                    return const SizedBox.shrink();
                  }

                  return ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    itemCount: updatedFavorites.length,
                    separatorBuilder: (_, _) => SizedBox(height: 14.h),
                    itemBuilder: (_, index) {
                      final fav = updatedFavorites[index];
                      final isLoading =
                          state is FavoriteActionLoading &&
                          state.loadingPropertyId == fav.property.id;

                      return Stack(
                        children: [
                          PropertyCard(
                            property: fav.property,
                            isWide: true,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => PropertyDetailsView(
                                    propertyId: fav.property.id,
                                  ),
                                ),
                              );
                            },
                          ),
                          if (isLoading)
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }

  List<FavoriteEntity> _getUpdatedItems(FavoriteState state) {
    List<FavoriteEntity> allFavorites = [];

    if (state is FavoriteLoaded) {
      allFavorites = state.favorites;
    } else if (state is FavoriteActionLoading) {
      allFavorites = state.favorites;
    } else {
      return items; // fallback للـ items الأصلية
    }

    // فلتر بس الـ category دي
    return allFavorites
        .where((f) => f.property.category.name == categoryName)
        .toList();
  }
}
