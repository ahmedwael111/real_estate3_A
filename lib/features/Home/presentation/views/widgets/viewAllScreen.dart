import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_estate3_a/features/Home/presentation/views/widgets/price_field.dart';
import 'package:real_estate3_a/generated/assets.dart';

import '../../../domain/entities/property_cardEntity.dart';
import '../../home_cubit/home_cubit.dart';
import 'CategoryChip.dart';
import 'Type_Chip.dart';
import 'propertyCard.dart';
import '../../../domain/entities/categoryEntity.dart';

class ViewAllScreen extends StatefulWidget {
  final String title;
  final List<PropertyCardEntity> items;

  const ViewAllScreen({super.key, required this.title, required this.items});

  @override
  State<ViewAllScreen> createState() => _ViewAllScreenState();
}

class _ViewAllScreenState extends State<ViewAllScreen> {
  int _selectedCategoryIndex = 0;
  String _searchQuery = '';
  String? _selectedListingType;
  double? _minPrice;
  double? _maxPrice;

  final TextEditingController _searchController = TextEditingController();

  List<PropertyCardEntity> get _filteredItems {
    return widget.items.where((p) {
      // 🔍 Search
      if (_searchQuery.isNotEmpty) {
        final q = _searchQuery.toLowerCase();
        final hit =
            p.title.toLowerCase().contains(q) ||
            p.address.toLowerCase().contains(q) ||
            p.category.name.toLowerCase().contains(q);

        if (!hit) return false;
      }

      // 🏷 Category
      if (_selectedCategoryIndex != 0) {
        final uniqueCats = widget.items.map((e) => e.category).toSet().toList();

        if (p.category.id != uniqueCats[_selectedCategoryIndex - 1].id) {
          return false;
        }
      }

      // 🏠 Listing type
      if (_selectedListingType != null) {
        final wantRent = _selectedListingType == 'rent';

        if (wantRent && p.listingType != ListingType.rent) {
          return false;
        }
        if (!wantRent && p.listingType != ListingType.sale) {
          return false;
        }
      }

      // 💰 Price
      if (_minPrice != null && p.price < _minPrice!) return false;
      if (_maxPrice != null && p.price > _maxPrice!) return false;

      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final uniqueCats = widget.items.map((e) => e.category).toSet().toList();

    final categories = [
      CategoryEntity(
        id: -1,
        name: 'All',
        slug: 'all',
        description: '',
        sortOrder: 0,
      ),
      ...uniqueCats,
    ];

    final items = _filteredItems;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            _buildSearchBar(context),
            SizedBox(height: 14.h),
            _buildCategories(context, categories),
            SizedBox(height: 16.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                '${items.length} ${items.length == 1 ? 'result' : 'results'}',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: const Color(0xFF6B7280),
                ),
              ),
            ),

            SizedBox(height: 12.h),

            Expanded(
              child: items.isEmpty
                  ? _buildEmpty()
                  : ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      itemCount: items.length,
                      separatorBuilder: (_, __) => SizedBox(height: 14.h),
                      itemBuilder: (_, index) => PropertyCard(
                        property: items[index],
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

  // ================= HEADER =================
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              context.read<HomeCubit>().clearFilter();
              context.read<HomeCubit>().onSearchChanged('');
              context.read<HomeCubit>().onCategorySelected(-1);
              Navigator.pop(context);
            },
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

  bool get _hasActiveFilter =>
      _selectedListingType != null || _minPrice != null || _maxPrice != null;

  Widget _buildSearchBar(BuildContext context) {
    final hasFilter = _hasActiveFilter;

    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 52.h,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onChanged: (v) => setState(() => _searchQuery = v),
                      decoration: InputDecoration(
                        hintText: 'Search your home...',
                        border: InputBorder.none,
                        suffixIcon: _searchController.text.isNotEmpty
                            ? GestureDetector(
                                onTap: () {
                                  _searchController.clear();
                                  setState(() => _searchQuery = '');
                                },
                                child: const Icon(Icons.close),
                              )
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 12.w),

          GestureDetector(
            onTap: () => _showFilterSheet(context),
            child: Container(
              width: 52.r,
              height: 52.r,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: hasFilter ? const Color(0xFF2EC4B6) : Colors.white,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: SvgPicture.asset(Assets.assetsFilterHome),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories(
    BuildContext context,
    List<CategoryEntity> categories,
  ) {
    return SizedBox(
      height: 38.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemCount: categories.length,
        separatorBuilder: (_, __) => SizedBox(width: 10.w),
        itemBuilder: (context, index) => CategoryChip(
          category: categories[index],
          isSelected: _selectedCategoryIndex == index,
          onTap: () {
            setState(() => _selectedCategoryIndex = index);
          },
        ),
      ),
    );
  }

  Widget _buildEmpty() {
    return const Center(child: Text("No results found"));
  }

  // ================= FILTER =================
  void _showFilterSheet(BuildContext context) {
    String? selectedType = _selectedListingType;

    final minCtrl = TextEditingController(text: _minPrice?.toString() ?? '');
    final maxCtrl = TextEditingController(text: _maxPrice?.toString() ?? '');

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => StatefulBuilder(
        builder: (ctx, setSheetState) => Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 30.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE5E7EB),
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Filter',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setSheetState(() {
                          selectedType = null;
                          minCtrl.clear();
                          maxCtrl.clear();
                        });
                      },
                      child: Text(
                        'Clear all',
                        style: TextStyle(color: const Color(0xFF2EC4B6)),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                // Listing Type
                Text('Listing Type'),
                SizedBox(height: 10.h),

                Row(
                  children: [
                    TypeChip(
                      label: 'All',
                      selected: selectedType == null,
                      onTap: () => setSheetState(() => selectedType = null),
                    ),
                    SizedBox(width: 10.w),
                    TypeChip(
                      label: 'For Sale',
                      selected: selectedType == 'sale',
                      onTap: () => setSheetState(() => selectedType = 'sale'),
                    ),
                    SizedBox(width: 10.w),
                    TypeChip(
                      label: 'For Rent',
                      selected: selectedType == 'rent',
                      onTap: () => setSheetState(() => selectedType = 'rent'),
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                // Price
                Text('Price Range'),
                SizedBox(height: 10.h),

                Row(
                  children: [
                    Expanded(
                      child: PriceField(controller: minCtrl, hint: 'Min price'),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: PriceField(controller: maxCtrl, hint: 'Max price'),
                    ),
                  ],
                ),

                SizedBox(height: 28.h),

                SizedBox(
                  width: double.infinity,
                  height: 52.h,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedListingType = selectedType;
                        _minPrice = double.tryParse(minCtrl.text);
                        _maxPrice = double.tryParse(maxCtrl.text);
                      });

                      Navigator.pop(ctx);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2EC4B6),
                    ),
                    child: const Text('Apply Filter'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
