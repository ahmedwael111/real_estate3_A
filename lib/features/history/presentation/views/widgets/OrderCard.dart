
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../core/constant/cached_image_widget.dart';
import '../../../domain/entity/OrderHistoryEntity.dart';
import 'OrderStatusBadge.dart';

class OrderCard extends StatelessWidget {
  final OrderHistoryEntity order;
  final VoidCallback? onPayNow; // shown only when hasPendingPayment

  const OrderCard({
    super.key,
    required this.order,
    this.onPayNow,
  });

  @override
  Widget build(BuildContext context) {
    final property = order.property;
    final formattedDate =
    DateFormat('d MMM yyyy').format(order.createdAt);
    final formattedAmount =
        '\$${_formatAmount(order.amount)} ${order.currency.toUpperCase()}';

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Image ──
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
            child: property.firstImageUrl != null
                ? CachedImageWidget(
              imageUrl: property.firstImageUrl!,
              height: 160.h,
              width: double.infinity,
              fit: BoxFit.cover,
            )
                : Container(
              height: 160.h,
              width: double.infinity,
              color: const Color(0xFFEEEEEE),
              child: const Icon(
                Icons.home_outlined,
                size: 48,
                color: Color(0xFF9E9E9E),
              ),
            ),
          ),

          // ── Content ──
          Padding(
            padding: EdgeInsets.all(14.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title + Badge
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        property.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1E1E1E),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    OrderStatusBadge(status: order.status),
                  ],
                ),

                SizedBox(height: 8.h),

                // Address
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 14,
                      color: Color(0xFF9E9E9E),
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Text(
                        property.address,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xFF9E9E9E),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 12.h),

                // Divider
                const Divider(height: 1, color: Color(0xFFF0F0F0)),

                SizedBox(height: 12.h),

                // Amount + Date
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Amount',
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: const Color(0xFF9E9E9E),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          formattedAmount,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF1597A8),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Order Date',
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: const Color(0xFF9E9E9E),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          formattedDate,
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF1E1E1E),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // "Pay Now" button — only when Stripe session exists & still pending
                if (order.hasPendingPayment && onPayNow != null) ...[
                  SizedBox(height: 12.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: onPayNow,
                      icon: const Icon(Icons.payment_outlined, size: 18),
                      label: const Text('Complete Payment'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1597A8),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        textStyle: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatAmount(String raw) {
    final val = double.tryParse(raw) ?? 0;
    if (val >= 1000000) {
      return '${(val / 1000000).toStringAsFixed(2)}M';
    } else if (val >= 1000) {
      return '${(val / 1000).toStringAsFixed(1)}K';
    }
    return val.toStringAsFixed(0);
  }
}
