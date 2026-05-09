import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate3_a/features/Home/presentation/views/widgets/propertyCard.dart';

class HomeHorizontalList extends StatelessWidget {
  final List items;
  final bool isWide;
  final void Function(int index)? onTap;

  const HomeHorizontalList({
    super.key,
    required this.items,
    required this.isWide,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.28,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemCount: items.length,
        separatorBuilder: (_, _) => SizedBox(width: 14.w),
        itemBuilder: (context, index) => PropertyCard(
          property: items[index],
          isWide: isWide,
          onTap: () => onTap?.call(index),
        ),
      ),
    );
  }
}
