import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entities/favoriteEntity.dart';

class FavoriteCategoryGridCard extends StatelessWidget {
  final String categoryName;
  final List<FavoriteEntity> items;
  final VoidCallback onTap;

  const FavoriteCategoryGridCard({
    super.key,
    required this.categoryName,
    required this.items,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // جيب أول 4 صور
    final images = items
        .map((e) => e.property.thumbnailUrl)
        .where((url) => url != null)
        .take(4)
        .toList();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── 2x2 Grid of images ──────────────────────────────────
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                child: _buildImageGrid(images),
              ),
            ),

            // ── Category name + count ───────────────────────────────
            Padding(
              padding: EdgeInsets.fromLTRB(12.w, 10.h, 12.w, 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    categoryName,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF1A1A2E),
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    _lastAdded(),
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: const Color(0xFF9CA3AF),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageGrid(List<String?> images) {
    // لو فيه صورة واحدة بس
    if (images.length == 1) {
      return _netImage(images[0]);
    }

    // لو اتنين
    if (images.length == 2) {
      return Row(
        children: [
          Expanded(child: _netImage(images[0])),
          SizedBox(width: 1),
          Expanded(child: _netImage(images[1])),
        ],
      );
    }

    // لو تلاتة
    if (images.length == 3) {
      return Row(
        children: [
          Expanded(child: _netImage(images[0])),
          SizedBox(width: 1),
          Expanded(
            child: Column(
              children: [
                Expanded(child: _netImage(images[1])),
                SizedBox(height: 1),
                Expanded(child: _netImage(images[2])),
              ],
            ),
          ),
        ],
      );
    }

    // 4 صور - 2x2
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(child: _netImage(images[0])),
              SizedBox(width: 1),
              Expanded(child: _netImage(images[1])),
            ],
          ),
        ),
        SizedBox(height: 1),
        Expanded(
          child: Row(
            children: [
              Expanded(child: _netImage(images[2])),
              SizedBox(width: 1),
              Expanded(child: _netImage(images[3])),
            ],
          ),
        ),
      ],
    );
  }

  Widget _netImage(String? url) {
    if (url == null) {
      return Center(
        child: Container(
          color: const Color(0xFFF3F4F6),
          child: const Icon(Icons.home_outlined, color: Color(0xFF9CA3AF)),
        ),
      );
    }
    return Image.network(
      url,
      fit: BoxFit.cover,
      errorBuilder: (_, _, _) => Container(
        color: const Color(0xFFF3F4F6),
        child: Center(
          child: const Icon(Icons.home_outlined, color: Color(0xFF9CA3AF)),
        ),
      ),
    );
  }

  String _lastAdded() {
    // نرجع "Today" أو "1 week ago" زي الـ Figma
    // لو عندك createdAt في الـ entity استخدمه، غير كده نرجع count
    return '${items.length} ${items.length == 1 ? 'property' : 'properties'}';
  }
}
