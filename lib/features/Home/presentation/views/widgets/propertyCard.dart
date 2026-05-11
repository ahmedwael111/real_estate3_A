import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_estate3_a/core/utils/app_styles.dart';
import 'package:real_estate3_a/features/Home/presentation/views/widgets/fav_button.dart';
import 'package:real_estate3_a/generated/assets.dart';
import '../../../domain/entities/property_cardEntity.dart';

class PropertyCard extends StatelessWidget {
  final PropertyCardEntity property;
  final VoidCallback? onTap;
  final bool isWide; // for featured horizontal cards

  const PropertyCard({
    super.key,
    required this.property,
    this.onTap,
    this.isWide = false,
  });

  @override
  Widget build(BuildContext context) {
    return isWide ? _buildWideCard(context) : _buildNormalCard(context);
  }

  Widget _buildNormalCard(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width.w;
    final height = MediaQuery.sizeOf(context).height.h;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width * 0.5,

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
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16.r),
                  ),
                  child: property.thumbnailUrl != null
                      ? Image.network(
                          property.thumbnailUrl!,
                          height: height * 0.18,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) => _imagePlaceholder(double.infinity, height * 0.18),
                        )
                      : _imagePlaceholder(double.infinity, height * 0.18),
                ),
                Positioned(
                  top: 10.h,
                  left: 10.w,
                  child: _ListingBadge(type: property.listingType),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.all(10.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          _cleanTitle(property.title),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(width: 6.w),
                      FavButton(propertyId: property.id),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      SvgPicture.asset(
                        Assets.assetsLocationHome,
                        width: 13.w,
                        height: 13.h,
                      ),
                      SizedBox(width: 4.w),

                      Expanded(
                        child: Text(
                          property.address,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 10.sp,
                            color: const Color(0xFF6B7280),
                          ),
                        ),
                      ),

                      SizedBox(width: 6.w),

                      Container(
                        width: 1.w,
                        height: 12.h,
                        color: const Color(0xFF6B7280).withOpacity(0.5),
                      ),

                      SizedBox(width: 6.w),

                      SvgPicture.asset(
                        Assets.assetsNavigationHome,
                        width: 13.w,
                        height: 13.h,
                      ),

                      SizedBox(width: 3.w),

                      Text(
                        '500 miles',
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF6B7280),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _formatPrice(property.price, property.listingType),
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            Assets.assetsReviewIcon,
                            width: 13,
                            height: 13,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            "4.9",
                            style: getRegularStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWideCard(BuildContext context) {
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(16.r),
                  ),
                  child: property.thumbnailUrl != null
                      ? Image.network(
                          property.thumbnailUrl!,
                          height: 170.h,
                          width: 170.w,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) =>
                              _imagePlaceholderSquare(170.w, 170.h),
                        )
                      : _imagePlaceholderSquare(170.w, 170.h),
                ),
                Positioned(
                  top: 10.h,
                  left: 10.w,
                  child: _ListingBadge(type: property.listingType),
                ),
              ],
            ),

            // Details
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start, // مهم
                      children: [
                        Expanded(
                          child: Text(
                            _cleanTitle(property.title),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: getMediumStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(width: 6.w),
                        FavButton(propertyId: property.id),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        SvgPicture.asset(
                          Assets.assetsLocationHome,
                          width: 13.w,
                          height: 13.h,
                        ),
                        SizedBox(width: 4.w),

                        Expanded(
                          child: Text(
                            property.address,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 10.sp,
                              color: const Color(0xFF6B7280),
                            ),
                          ),
                        ),

                        SizedBox(width: 6.w),

                        Container(
                          width: 1.w,
                          height: 12.h,
                          color: const Color(0xFF6B7280).withOpacity(0.5),
                        ),

                        SizedBox(width: 6.w),

                        SvgPicture.asset(
                          Assets.assetsNavigationHome,
                          width: 13.w,
                          height: 13.h,
                        ),

                        SizedBox(width: 3.w),

                        Text(
                          '500 miles',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF6B7280),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _formatPrice(property.price, property.listingType),
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              Assets.assetsReviewIcon,
                              width: 13,
                              height: 13,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              "4.9",
                              style: getRegularStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _cleanTitle(String title) {
    if (title.contains('—')) {
      return title.split('—').last.trim();
    }
    return title;
  }

  Widget _imagePlaceholder(double w, double h) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: Image.network(
        'https://tse4.mm.bing.net/th/id/OIP.azidKobVRfGjX2RGXBu6EAHaEb?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
        fit: BoxFit.cover,
        width:w,
        height: h,
      ),
    );
  }

  Widget _imagePlaceholderSquare(double w, double h) {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(16.r),
      ),
      child: Image.network(
        'https://tse4.mm.bing.net/th/id/OIP.azidKobVRfGjX2RGXBu6EAHaEb?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
        width: w,
        height: h,
        fit: BoxFit.cover,
      ),
    );
  }

  String _formatPrice(double price, ListingType type) {
    final formatted = price >= 1000000
        ? '${(price / 1000000).toStringAsFixed(1)}M'
        : price >= 1000
        ? '${(price / 1000).toStringAsFixed(0)}K'
        : price.toStringAsFixed(0);

    return type == ListingType.rent ? 'EGP $formatted/mo' : 'EGP $formatted';
  }
}

class _ListingBadge extends StatelessWidget {
  final ListingType type;
  final bool compact;

  const _ListingBadge({required this.type, this.compact = false});

  @override
  Widget build(BuildContext context) {
    final isRent = type == ListingType.rent;
    return Container(
      padding: EdgeInsets.symmetric(),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
        child: Row(
          children: [
            SvgPicture.asset(Assets.assetsSaleProperty),
            SizedBox(width: 4.w),
            Text(
              isRent ? 'For Rent' : 'For Sale',
              style: TextStyle(
                fontSize: compact ? 10.sp : 10.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
