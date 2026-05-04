import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate3_a/generated/assets.dart';

import '../../home_cubit/home_cubit.dart';

class HomeSearchbar extends StatefulWidget {
  const HomeSearchbar({super.key});

  @override
  State<HomeSearchbar> createState() => _HomeSearchbarState();
}

class _HomeSearchbarState extends State<HomeSearchbar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final hasFilter =
            state is HomeLoaded && state.hasActiveFilter;

        return Padding(
          padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
          child: Row(
            children: [
              // ── Search field ──────────────────────────────────
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
                          controller: _controller,
                          onChanged: (v) =>
                              context.read<HomeCubit>().onSearchChanged(v),
                          decoration: InputDecoration(
                            hintText: 'Search your home...',
                            hintStyle: TextStyle(
                              fontSize: 14.sp,
                              color: const Color(0xFF9CA3AF),
                            ),
                            border: InputBorder.none,
                            isDense: true,
                            // X لو في نص
                            suffixIcon: _controller.text.isNotEmpty
                                ? GestureDetector(
                              onTap: () {
                                _controller.clear();
                                context
                                    .read<HomeCubit>()
                                    .onSearchChanged('');
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
                          onTapOutside: (_) => FocusScope.of(context).unfocus(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(width: 12.w),

              // ── Filter button ─────────────────────────────────
              GestureDetector(
                onTap: () => _showFilterSheet(context),
                child: Stack(
                  children: [
                    Container(
                      width: 52.r,
                      height: 52.r,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        // لو في filter active يتلوّن
                        color: hasFilter
                            ? const Color(0xFF2EC4B6)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(24.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: SvgPicture.asset(
                        Assets.assetsFilterHome,
                        // لو active يخلي الأيقونة بيضاء
                        colorFilter: hasFilter
                            ? const ColorFilter.mode(
                            Colors.white, BlendMode.srcIn)
                            : null,
                      ),
                    ),
                    // نقطة حمراء لو في filter
                    if (hasFilter)
                      Positioned(
                        top: 6.r,
                        right: 6.r,
                        child: Container(
                          width: 8.r,
                          height: 8.r,
                          decoration: const BoxDecoration(
                            color: Colors.redAccent,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ── Filter Bottom Sheet ───────────────────────────────────────────────────
  void _showFilterSheet(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    final currentState = cubit.state;

    String? selectedType = cubit.selectedListingType;
    final minCtrl = TextEditingController(
      text: cubit.minPrice?.toStringAsFixed(0) ?? '',
    );
    final maxCtrl = TextEditingController(
      text: cubit.maxPrice?.toStringAsFixed(0) ?? '',
    );

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return StatefulBuilder(
          builder: (ctx, setSheetState) {
            return Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(ctx).viewInsets.bottom,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.vertical(top: Radius.circular(24.r)),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 30.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // handle
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

                    // Title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Filter',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF1A1A2E),
                          ),
                        ),
                        // Clear
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
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: const Color(0xFF2EC4B6),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20.h),

                    // ── Listing Type ──────────────────────────────
                    Text(
                      'Listing Type',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1A1A2E),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        _TypeChip(
                          label: 'All',
                          selected: selectedType == null,
                          onTap: () =>
                              setSheetState(() => selectedType = null),
                        ),
                        SizedBox(width: 10.w),
                        _TypeChip(
                          label: 'For Sale',
                          selected: selectedType == 'sale',
                          onTap: () =>
                              setSheetState(() => selectedType = 'sale'),
                        ),
                        SizedBox(width: 10.w),
                        _TypeChip(
                          label: 'For Rent',
                          selected: selectedType == 'rent',
                          onTap: () =>
                              setSheetState(() => selectedType = 'rent'),
                        ),
                      ],
                    ),

                    SizedBox(height: 20.h),

                    // ── Price Range ───────────────────────────────
                    Text(
                      'Price Range (EGP)',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1A1A2E),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Expanded(
                          child: _PriceField(
                            controller: minCtrl,
                            hint: 'Min price',
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: _PriceField(
                            controller: maxCtrl,
                            hint: 'Max price',
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 28.h),

                    // ── Apply button ──────────────────────────────
                    SizedBox(
                      width: double.infinity,
                      height: 52.h,
                      child: ElevatedButton(
                        onPressed: () {
                          final min = double.tryParse(minCtrl.text);
                          final max = double.tryParse(maxCtrl.text);
                          cubit.applyFilter(
                            listingType: selectedType,
                            minPrice: min,
                            maxPrice: max,
                          );
                          Navigator.pop(ctx);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2EC4B6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Apply Filter',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

// ── Type chip ─────────────────────────────────────────────────────────────────
class _TypeChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _TypeChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF2EC4B6) : const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: selected
                ? const Color(0xFF2EC4B6)
                : const Color(0xFFE5E7EB),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
            color: selected ? Colors.white : const Color(0xFF6B7280),
          ),
        ),
      ),
    );
  }
}

// ── Price field ───────────────────────────────────────────────────────────────
class _PriceField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  const _PriceField({required this.controller, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 13.sp,
            color: const Color(0xFF9CA3AF),
          ),
          border: InputBorder.none,
          isDense: true,
        ),
        style: TextStyle(
          fontSize: 13.sp,
          color: const Color(0xFF1A1A2E),
        ),
      ),
    );
  }
}