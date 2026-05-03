import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../generated/assets.dart';

class HomeSearchbar extends StatelessWidget {
  const HomeSearchbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: Container(
              height: 52.h,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    size: 20.sp,
                    color: const Color(0xFF9CA3AF),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search your home...',
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xFF9CA3AF),
                        ),
                        border: InputBorder.none,
                        isDense: true,
                      ),
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFF1A1A2E),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(width: 20.w),

          Expanded(
            flex: 1,
            child: Container(
              height: 52.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: SvgPicture.asset(Assets.assetsFilterHome),
            ),
          ),
        ],
      ),
    );
  }
}
