import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 60.h)),

          /// Search Bar
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                height: 52.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 20.h)),

          /// Categories
          SliverToBoxAdapter(
            child: SizedBox(
              height: 40.h,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, __) => Container(
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                separatorBuilder: (_, __) => SizedBox(width: 10.w),
                itemCount: 5,
              ),
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 24.h)),

          /// Horizontal Cards
          SliverToBoxAdapter(
            child: SizedBox(
              height: 260.h,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, __) => Container(
                  width: 220.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                ),
                separatorBuilder: (_, __) => SizedBox(width: 14.w),
                itemCount: 3,
              ),
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 24.h)),

          /// Grid
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                    (_, __) => Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                ),
                childCount: 4,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14.w,
                mainAxisSpacing: 14.h,
                childAspectRatio: 200 / 300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}