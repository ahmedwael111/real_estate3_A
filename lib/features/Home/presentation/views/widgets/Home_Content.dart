import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate3_a/features/Home/presentation/views/widgets/HomeCategoryList.dart';
import 'package:real_estate3_a/features/Home/presentation/views/widgets/Home_AppBar.dart';
import 'package:real_estate3_a/features/Home/presentation/views/widgets/Home_searchBar.dart';
import 'package:real_estate3_a/features/Home/presentation/views/widgets/propertyCard.dart';
import 'package:real_estate3_a/features/Home/presentation/views/widgets/viewAllScreen.dart';

import '../../../../../core/funcations/app_functions.dart';
import '../../../../Favorits/presentation/cubit/favorite_cubit.dart';
import '../../home_cubit/home_cubit.dart';
import 'HomeHorizontalList.dart';
import 'SectionHeader.dart';

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
            SliverToBoxAdapter(child: SizedBox(height: 16.h)),

            SliverToBoxAdapter(
              child: SectionHeader(
                title: 'Best Selling',
                onViewAll: () {
                  AppFunctions.navigateTo(
                    context,
                    BlocProvider.value(
                      value: context.read<FavoriteCubit>(),
                      child: ViewAllScreen(title: "Best Selling", items: state.filteredBestSelling),
                    ),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16.h)),
            SliverToBoxAdapter(
              child: HomeHorizontalList(
                items: state.filteredBestSelling,
                isWide: false,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16.h)),
            SliverToBoxAdapter(
              child: SectionHeader(
                title: 'Featured',
                onViewAll: () {
                  AppFunctions.navigateTo(
                    context,
                    BlocProvider.value(
                      value: context.read<FavoriteCubit>(),
                      child: ViewAllScreen(title: "Featured", items: state.filteredBestSelling),
                    ),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16.h)),
            SliverToBoxAdapter(
              child: HomeHorizontalList(
                items: state.filteredFeatured,
                isWide: false,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16.h)),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  "Recommended",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF1A1A2E),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16.h)),
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
