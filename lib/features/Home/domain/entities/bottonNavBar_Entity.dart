import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_estate3_a/core/utils/app_colors.dart';
import 'package:real_estate3_a/generated/assets.dart';

class BottomNavigationBarEntity {
  final SvgPicture activeIcon;
  final SvgPicture inActiveIcon;
  final String text;

  BottomNavigationBarEntity(this.activeIcon,this.inActiveIcon, this.text);
}

List<BottomNavigationBarEntity> get BottomNavBarItems => [
  BottomNavigationBarEntity(
    SvgPicture.asset(Assets.assetsHomeNav, width: 16.w, height: 16.h,color: AppColors.splashColor,),
    SvgPicture.asset(Assets.assetsHomeNav, width: 16.w, height: 16.h,),
       "Home",
  ),
  BottomNavigationBarEntity(
    SvgPicture.asset(Assets.assetsFavNav, width: 24.w, height: 21.h,color: AppColors.splashColor,),
    SvgPicture.asset(Assets.assetsFavNav, width: 24.w, height: 21.h),
    "Favorite",
  ),
  BottomNavigationBarEntity(

    SvgPicture.asset(Assets.assetsMabNav, width: 24.w, height: 21.h,color: AppColors.splashColor,),
    SvgPicture.asset(Assets.assetsMabNav, width: 24.w, height: 21.h),
    "Mab",
  ),
  BottomNavigationBarEntity(
      SvgPicture.asset(Assets.assetsHistoryNav, width: 24.w, height: 21.h,color: AppColors.splashColor,),
      SvgPicture.asset(Assets.assetsHistoryNav, width: 24.w, height: 21.h),
      "History"),
  BottomNavigationBarEntity(
      SvgPicture.asset(Assets.assetsHistoryNav, width: 24.w, height: 21.h,color: AppColors.splashColor,),
      SvgPicture.asset(Assets.assetsHistoryNav, width: 24.w, height: 21.h),
      "Person"),
];
