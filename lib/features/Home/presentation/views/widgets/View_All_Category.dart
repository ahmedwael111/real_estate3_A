import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_estate3_a/features/Home/presentation/views/widgets/propertyCard.dart';
import 'package:real_estate3_a/generated/assets.dart';

import '../../../domain/entities/categoryEntity.dart';
import '../../../domain/entities/home_dateEntity.dart';
import '../../../domain/entities/property_cardEntity.dart';
import 'CategoryChip.dart';


class ViewAllScreen extends StatefulWidget {
  final String title;       // "Best Selling" / "Featured" / "Recommended"
  final HomeDataEntity homeData;

  const ViewAllScreen({
    super.key,
    required this.title,
    required this.homeData,
  });

  @override
  State<ViewAllScreen> createState() => _ViewAllScreenState();
}

class _ViewAllScreenState extends State<ViewAllScreen> {
  int _selectedCategoryIndex = 0; // 0 = All
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  // ── الـ properties بناءً على الـ title اللي جاي من الـ home ──────────────
  List<PropertyCardEntity> get _allItems {
    switch (widget.title) {
      case 'Best Selling':
        return widget.homeData.bestSelling;
      case 'Featured':
        return widget.homeData.featured;
      case 'Recommended':
        return widget.homeData.recommended;
      default:
        return widget.homeData.bestSelling;
    }
  }

  // ── All + الـ categories اللي موجودة فعلاً في الـ items دول ─────────────
  List<CategoryEntity> get _availableCategories => widget.homeData.categories;

  // ── الـ items بعد الـ filter ─────────────────────────────────────────────
  List<PropertyCardEntity> get _filteredItems {
    var items = _allItems;

    // filter by category (index 0 = All)
    if (_selectedCategoryIndex != 0) {
      final selectedCategory =
      _availableCategories[_selectedCategoryIndex - 1];
      items = items
          .where((p) => p.category.id == selectedCategory.id)
          .toList();
    }

    // filter by search
    if (_searchQuery.isNotEmpty) {
      final q = _searchQuery.toLowerCase();
      items = items
          .where((p) =>
      p.title.toLowerCase().contains(q) ||
          p.address.toLowerCase().contains(q) ||
          p.category.name.toLowerCase().contains(q))
          .toList();
    }

    return items;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filteredItems;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header ───────────────────────────────────────────


            // ── Search ───────────────────────────────────────────
            _buildSearchBar(),

            SizedBox(height: 14.h),

            // ── Categories ───────────────────────────────────────
            _buildCategories(),

            SizedBox(height: 16.h),

            // ── Results count ────────────────────────────────────
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                '${filtered.length} ${filtered.length == 1 ? 'result' : 'results'}',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: const Color(0xFF6B7280),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            SizedBox(height: 12.h),

            // ── List ─────────────────────────────────────────────
            Expanded(
              child: filtered.isEmpty
                  ? _buildEmpty()
                  : ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                itemCount: filtered.length,
                separatorBuilder: (_, __) => SizedBox(height: 14.h),
                itemBuilder: (context, index) => PropertyCard(
                  property: filtered[index],
                  isWide: true,
                  onTap: () {},
                ),
              ),
            ),

            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }


  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 40.r,
              height: 40.r,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.07),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 16.r,
                color: const Color(0xFF1A1A2E),
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1A1A2E),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
      child: Row(
        children: [
          // Search field
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
                  Icon(Icons.search,
                      size: 20.sp, color: const Color(0xFF9CA3AF)),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onChanged: (v) => setState(() => _searchQuery = v),
                      decoration: InputDecoration(
                        hintText: 'Search your home...',
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xFF9CA3AF),
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        suffixIcon: _searchQuery.isNotEmpty
                            ? GestureDetector(
                          onTap: () {
                            _searchController.clear();
                            setState(() => _searchQuery = '');
                          },
                          child: Icon(Icons.close,
                              size: 16.r,
                              color: const Color(0xFF9CA3AF)),
                        )
                            : null,
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

          SizedBox(width: 12.w),

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

  // ── Categories ────────────────────────────────────────────────────────────
  Widget _buildCategories() {

    final allCategories = [
      CategoryEntity(
          id: -1,
          name: 'All',
          slug: 'all',
          description: '',
          sortOrder: 0),
      ..._availableCategories,
    ];

    return SizedBox(
      height: 38.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemCount: allCategories.length,
        separatorBuilder: (_, __) => SizedBox(width: 10.w),
        itemBuilder: (context, index) => CategoryChip(
          category: allCategories[index],
          isSelected: _selectedCategoryIndex == index,
          onTap: () => setState(() => _selectedCategoryIndex = index),
        ),
      ),
    );
  }


  Widget _buildEmpty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off_rounded,
              size: 56.r, color: const Color(0xFFD1D5DB)),
          SizedBox(height: 12.h),
          Text(
            'No results found',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF6B7280),
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            'Try a different search or category',
            style: TextStyle(
              fontSize: 13.sp,
              color: const Color(0xFF9CA3AF),
            ),
          ),
        ],
      ),
    );
  }
}