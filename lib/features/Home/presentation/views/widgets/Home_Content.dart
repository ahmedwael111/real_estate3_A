import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate3_a/features/Home/domain/entities/home_dateEntity.dart';
import 'package:real_estate3_a/features/Home/presentation/views/widgets/HomeCategoryList.dart';
import 'package:real_estate3_a/features/Home/presentation/views/widgets/Home_AppBar.dart';
import 'package:real_estate3_a/features/Home/presentation/views/widgets/Home_searchBar.dart';
import 'package:real_estate3_a/features/Home/presentation/views/widgets/propertyCard.dart';

import '../../../../../core/funcations/app_functions.dart';
import '../../home_cubit/home_cubit.dart';
import 'HomeHorizontalList.dart';
import 'SectionHeader.dart';
import 'View_All_Category.dart';

class HomeContent extends StatelessWidget {

  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is! HomeLoaded) return const SizedBox.shrink();

        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: HomeAppbar()),
            SliverToBoxAdapter(child: HomeSearchbar()),
            SliverToBoxAdapter(
              child: Homecategorylist(categories: state.homeData.categories),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 24.h)),

            // ✅ استخدم filteredBestSelling
            SliverToBoxAdapter(
              child: SectionHeader(title: 'Best Selling', onViewAll: () {}),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 24.h)),
            SliverToBoxAdapter(
              child: HomeHorizontalList(
                items: state.filteredBestSelling,
                isWide: false,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 24.h)),
            SliverToBoxAdapter(
              child: SectionHeader(title: 'Featured', onViewAll: () {}),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 24.h)),
            SliverToBoxAdapter(
              child: HomeHorizontalList(
                items: state.filteredFeatured,
                isWide: false,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 24.h)),
            SliverToBoxAdapter(
              child: SectionHeader(title: 'Recommended', onViewAll: () {

              }),
            ),
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
                      (context, index) => PropertyCard(
                    property: state.filteredRecommended[index],
                    onTap: () {},
                  ),
                  childCount: state.filteredRecommended.length,
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 30.h)),
          ],
        );
      },
    );
  }
}


