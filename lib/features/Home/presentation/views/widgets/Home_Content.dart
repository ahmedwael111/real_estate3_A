import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate3_a/features/Home/domain/entities/home_dateEntity.dart';
import 'package:real_estate3_a/features/Home/presentation/views/widgets/HomeCategoryList.dart';
import 'package:real_estate3_a/features/Home/presentation/views/widgets/Home_AppBar.dart';
import 'package:real_estate3_a/features/Home/presentation/views/widgets/Home_searchBar.dart';
import 'package:real_estate3_a/features/Home/presentation/views/widgets/propertyCard.dart';

import '../../../../../core/funcations/app_functions.dart';
import 'HomeHorizontalList.dart';
import 'SectionHeader.dart';
import 'View_All_Category.dart';

class HomeContent extends StatelessWidget {
  final HomeDataEntity data;

  const HomeContent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        // ── App Bar ─────────────────────────────────────
        SliverToBoxAdapter(child: HomeAppbar()),

        // ── Search Bar ───────────────────────────────────
        SliverToBoxAdapter(child: HomeSearchbar()),

        // ── Categories ───────────────────────────────────
        SliverToBoxAdapter(
          child: Homecategorylist(categories: data.categories),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 24.h)),

        // ── Best Selling ────────────────────────────────
        SliverToBoxAdapter(
          child: SectionHeader(
            title: 'Best Selling',
            onViewAll: () {
              AppFunctions.navigateTo(
                context,
                ViewAllScreen(title: "Best Selling", homeData: data),
              );
            },
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 14.h)),
        SliverToBoxAdapter(
          child: HomeHorizontalList(items: data.bestSelling, isWide: false),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 16.h)),

        // ── Featured ────────────────────────────────────
        SliverToBoxAdapter(
          child: SectionHeader(
            title: 'Featured',
            onViewAll: () {
              AppFunctions.navigateTo(
                context,
                ViewAllScreen(title: "Featured", homeData: data),
              );
            },
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 14.h)),
        SliverToBoxAdapter(
          child: HomeHorizontalList(items: data.featured, isWide: false),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 28.h)),

        // ── Recommended ────────────────────────────────
        SliverToBoxAdapter(
          child: SectionHeader(
            title: 'Recommended',
            onViewAll: () {
              AppFunctions.navigateTo(
                context,
                ViewAllScreen(title: "Recommended", homeData: data),
              );
            },
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 14.h)),

        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 14.w,
              mainAxisSpacing: 14.h,
              childAspectRatio: 200 / 220,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) =>
                  PropertyCard(property: data.recommended[index], onTap: () {}),
              childCount: data.recommended.length,
            ),
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 30.h)),
      ],
    );

  }


}



