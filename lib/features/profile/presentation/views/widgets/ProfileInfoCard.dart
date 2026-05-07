import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entity/profileEntity.dart';

class ProfileInfoCard extends StatelessWidget {
  final ProfileEntity profile;

  const ProfileInfoCard({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xffB8860B), Color(0xffDAA520)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xffB8860B).withOpacity(0.3),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          // ── Avatar ──────────────────────────────────────────────────
          CircleAvatar(
            radius: 32.r,
            backgroundColor: Colors.white.withOpacity(0.2),
            child: Text(
              profile.name.isNotEmpty
                  ? profile.name[0].toUpperCase()
                  : '?',
              style: TextStyle(
                fontSize: 28.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 16.w),

          // ── Info ─────────────────────────────────────────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profile.name,
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  profile.email,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white.withOpacity(0.85),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    profile.role.toUpperCase(),
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}