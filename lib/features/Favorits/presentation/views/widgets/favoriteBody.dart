
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate3_a/features/Favorits/presentation/views/widgets/favorite_content.dart';

import 'FavoriteHeader.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            const FavoriteHeader(),
            SizedBox(height: 16.h),
             Expanded(child: FavoriteContent()),
          ],
        ),
      ),
    );
  }
}