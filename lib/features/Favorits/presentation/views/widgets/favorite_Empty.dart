
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteEmpty extends StatelessWidget {
  const FavoriteEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border, size: 64.r),
          SizedBox(height: 16.h),
          Text('No favorites yet'),
        ],
      ),
    );
  }
}