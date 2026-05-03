import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/assets.dart';
import 'IconButton.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(Assets.assetsLocationHome),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'location',
                      style: getRegularStyle(
                        fontSize: 14,
                        color: AppColors.grey,
                      ),
                    ),
                    Text(
                      'Los Angeles, California',
                      style: getRegularStyle(
                        fontSize: 14,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Row(
              children: [
                IconButton(icon: Assets.assetsNotificationHome),
                SizedBox(width: 10.w),
                IconButton(icon: Assets.assetsChatHome),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
