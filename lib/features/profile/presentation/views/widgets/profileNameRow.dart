import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const Color _primary = Color(0xFF1597A8);
const Color _lightPrimary = Color(0xFFBFF8FF);
const Color _dark = Color(0xFF0D2B30);


const Color _nameRowPrimary      = Color(0xFF1597A8); // teal
const Color _nameRowLightPrimary = Color(0xFFBFF8FF); // light teal
const Color _nameRowDark         = Color(0xFF0D2B30);

class ProfileNameRow extends StatelessWidget {
  const ProfileNameRow({
    super.key,
    required this.name,
    required this.email,
    required this.role,
    this.onEditTap,
  });

  final String name;
  final String email;
  final String role;
  final VoidCallback? onEditTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Name + email ───────────────────────────────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: _nameRowDark,
                    letterSpacing: -0.3,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(children: const []),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(Icons.email_outlined,
                        size: 12.sp, color: Colors.grey[400]),
                    SizedBox(width: 4.w),
                    Flexible(
                      child: Text(
                        email,
                        style: TextStyle(
                            fontSize: 12.sp, color: Colors.grey[500]),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // ── Edit icon ──────────────────────────────────────────────
          if (onEditTap != null)
            GestureDetector(
              onTap: onEditTap,
              child: Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: _nameRowPrimary.withOpacity(.15), // was Color(0xffB8860B).withOpacity(.2)
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(
                  Icons.edit_outlined,
                  size: 16.sp,
                  color: _nameRowPrimary, // was Color(0xffB8860B)
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class RoleBadge extends StatelessWidget {
  const RoleBadge({super.key, required this.role});
  final String role;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: _nameRowLightPrimary, // was Color(0xFFBFF8FF) — already correct!
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        role.toUpperCase(),
        style: TextStyle(
          fontSize: 10.sp,
          color: _nameRowPrimary, // was _primary
          fontWeight: FontWeight.w700,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}