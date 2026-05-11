import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate3_a/features/Home/presentation/views/widgets/HomeCategoryList.dart';
import 'package:real_estate3_a/features/Home/presentation/views/widgets/Home_AppBar.dart';
import 'package:real_estate3_a/features/Home/presentation/views/widgets/Home_searchBar.dart';
import 'package:real_estate3_a/features/Home/presentation/views/widgets/propertyCard.dart';
import 'package:real_estate3_a/features/Home/presentation/views/widgets/viewAllScreen.dart';
import 'package:real_estate3_a/features/Property%20Details/presentaion/property_details_view.dart';

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

        if (state.isFiltering) {
          return _buildFilteredView(context, state);
        }

        return _buildNormalView(context, state);
      },
    );
  }

  Widget _buildFilteredView(BuildContext context, HomeLoaded state) {
    final items = state.allFilteredResults;

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(child: HomeAppbar()),
        SliverToBoxAdapter(child: HomeSearchbar()),
        SliverToBoxAdapter(
          child: Homecategorylist(categories: state.homeData.categories),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 16.h)),

        // عدد النتائج
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              '${items.length} ${items.length == 1 ? 'result' : 'results'} found',
              style: TextStyle(fontSize: 13.sp, color: const Color(0xFF6B7280)),
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 12.h)),

        if (items.isEmpty)
          SliverFillRemaining(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search_off_rounded,
                    size: 48.r,
                    color: const Color(0xFF9CA3AF),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'No results found',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF6B7280),
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    'Try different keywords or filters',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: const Color(0xFF9CA3AF),
                    ),
                  ),
                ],
              ),
            ),
          )
        else
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: EdgeInsets.only(bottom: 14.h),
                  child: PropertyCard(
                    property: items[index],
                    isWide: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              PropertyDetailsView(propertyId: items[index].id),
                        ),
                      );
                    },
                  ),
                ),
                childCount: items.length,
              ),
            ),
          ),

        SliverToBoxAdapter(child: SizedBox(height: 30.h)),
      ],
    );
  }

  // الـ view العادي زي ما هو بالظبط
  Widget _buildNormalView(BuildContext context, HomeLoaded state) {
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
                  child: ViewAllScreen(
                    title: "Best Selling",
                    items: state.filteredBestSelling,
                  ),
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
            onTap: (index) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PropertyDetailsView(
                    propertyId: state.filteredBestSelling[index].id,
                  ),
                ),
              );
            },
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
                  child: ViewAllScreen(
                    title: "Featured",
                    items: state.filteredFeatured,
                  ),
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
            onTap: (index) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PropertyDetailsView(
                    propertyId: state.filteredFeatured[index].id,
                  ),
                ),
              );
            },
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
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                padding: EdgeInsets.only(bottom: 14.h),
                child: PropertyCard(
                  property: state.filteredRecommended[index],
                  isWide: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PropertyDetailsView(
                          propertyId: state.filteredRecommended[index].id,
                        ),
                      ),
                    );
                  },
                ),
              ),
              childCount: state.filteredRecommended.length,
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 30.h)),
      ],
    );
  }
}
