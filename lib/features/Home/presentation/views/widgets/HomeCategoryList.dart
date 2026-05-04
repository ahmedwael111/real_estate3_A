

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate3_a/features/Home/domain/entities/categoryEntity.dart';

import '../../home_cubit/home_cubit.dart';
import 'CategoryChip.dart';

class Homecategorylist extends StatefulWidget {
  const Homecategorylist({Key? key,required this.categories}) : super(key: key);

final List<CategoryEntity> categories;

  @override
  State<Homecategorylist> createState() => _HomecategorylistState();
}

class _HomecategorylistState extends State<Homecategorylist> {
  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: SizedBox(
        height: 38.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          itemCount: widget.categories.length,
          separatorBuilder: (_, __) => SizedBox(width: 10.w),
          itemBuilder: (context, index) => CategoryChip(
            category: widget.categories[index],
            isSelected: selectedCategoryIndex == index,
            onTap: () {
              setState(() => selectedCategoryIndex = index); 
              final cat = widget.categories[index];
              context.read<HomeCubit>().onCategorySelected(cat.id);
            },
          ),
        ),
      ),
    );
  }
}
// Widget _buildCategories(List categories) {
//   return Padding(
//     padding: EdgeInsets.only(top: 16.h),
//     child: SizedBox(
//       height: 38.h,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         physics: const BouncingScrollPhysics(),
//         padding: EdgeInsets.symmetric(horizontal: 20.w),
//         itemCount: categories.length,
//         separatorBuilder: (_, __) => SizedBox(width: 10.w),
//         itemBuilder: (context, index) => CategoryChip(
//           category: categories[index],
//           isSelected: _selectedCategoryIndex == index,
//           onTap: () =>
//               setState(() => _selectedCategoryIndex = index),
//         ),
//       ),
//     ),
//   );
// }












