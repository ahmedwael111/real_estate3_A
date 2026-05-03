import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_estate3_a/core/funcations/app_functions.dart';
import 'package:real_estate3_a/core/utils/app_colors.dart';
import 'package:real_estate3_a/core/utils/app_styles.dart';
import 'package:real_estate3_a/features/Home/presentation/views/widgets/HomeCategoryList.dart';
import 'package:real_estate3_a/features/Home/presentation/views/widgets/Home_AppBar.dart';
import 'package:real_estate3_a/features/Home/presentation/views/widgets/Home_Content.dart';
import 'package:real_estate3_a/features/Home/presentation/views/widgets/Home_searchBar.dart';
import 'package:real_estate3_a/features/Home/presentation/views/widgets/View_All_Category.dart';
import 'package:real_estate3_a/features/Home/presentation/views/widgets/propertyCard.dart';
import 'package:real_estate3_a/generated/assets.dart';
import '../../../../../core/di.dart';
import '../../../domain/repo/HomeRepo.dart';
import '../../home_cubit/home_cubit.dart';
import 'CategoryChip.dart';
import 'SectionHeader.dart';

class HomeViewTest extends StatelessWidget {
  const HomeViewTest({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(getIt<HomeRepository>())..getHomeData(),
      child: const _HomeBody(),
    );
  }
}

class _HomeBody extends StatefulWidget {
  const _HomeBody();

  @override
  State<_HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<_HomeBody> {
  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF2EC4B6),
              ),
            );
          }

          if (state is HomeError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wifi_off_rounded,
                      size: 48.r, color: const Color(0xFF9CA3AF)),
                  SizedBox(height: 12.h),
                  Text(
                    state.message,
                    style: TextStyle(
                        fontSize: 14.sp, color: const Color(0xFF6B7280)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<HomeCubit>().getHomeData(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2EC4B6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text('Retry',
                        style: TextStyle(fontSize: 14.sp)),
                  ),
                ],
              ),
            );
          }

          if (state is HomeLoaded) {
            final data = state.homeData;

              return HomeContent(data: data);
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }







  // ── Horizontal list ────────────────────────────────────────────────────────
  Widget _buildHorizontalList(

      {
    required List items,
    required bool isWide,
  }) {
    return SizedBox(
      height:MediaQuery.sizeOf(context).height*0.28,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemCount: items.length,
        separatorBuilder: (_, __) => SizedBox(width: 14.w),
        itemBuilder: (context, index) => PropertyCard(
          property: items[index],
          isWide: isWide,
          onTap: () {},
        ),
      ),
    );
  }
}

