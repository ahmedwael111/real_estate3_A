import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate3_a/core/utils/app_colors.dart';
import '../../../domain/entity/profileEntity.dart';
import 'CoverPrinter.dart';
import 'edit_chip.dart';

// ── Theme colors ──────────────────────────────────────────────────────────────
const Color _primary      = Color(0xFF1597A8); // teal
const Color _lightPrimary = Color(0xFFBFF8FF); // light teal (replaces FFF3D6 / FFF8E7)
const Color _darkTeal     = Color(0xFF0D5F6E); // darker teal (for gradient start)

class ProfileHeaderCard extends StatelessWidget {
  const ProfileHeaderCard({
    super.key,
    required this.profile,
    required this.coverImage,
    required this.avatarImage,
    required this.onPickCover,
    required this.onPickAvatar,
  });

  final ProfileEntity profile;
  final File? coverImage;
  final File? avatarImage;
  final VoidCallback onPickCover;
  final VoidCallback onPickAvatar;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // ── Cover ────────────────────────────────────────────────────
        SizedBox(
          height: 160.h,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              coverImage != null
                  ? Image.file(coverImage!, fit: BoxFit.cover)
                  : Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF0D5F6E), // dark teal  (was 0xFF6D4C00)
                      Color(0xFF1597A8), // teal        (was 0xFFB8860B)
                      Color(0xFFBFF8FF), // light teal  (was 0xFFFFD166)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: CustomPaint(painter: WavePainter()),
              ),

              // Edit cover button
              Positioned(
                top: 12.h,
                right: 12.w,
                child: EditChip(label: 'Edit Cover', onTap: onPickCover),
              ),
            ],
          ),
        ),

        // ── Avatar (يطلع نص من الـ cover) ────────────────────────────
        Positioned(
          bottom: 10.h,
          left: 20.w,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFE0F8FB), // was Color(0xFFFFF8E7)
                    width: 4,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: _primary.withOpacity(0.25), // was gold opacity
                      blurRadius: 18,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 44.r,
                  backgroundColor: _lightPrimary, // was Color(0xFFFFF3D6)
                  backgroundImage:
                  avatarImage != null ? FileImage(avatarImage!) : null,
                  child: null,
                ),
              ),
              // Camera badge
              Positioned(
                bottom: 2,
                right: 2,
                child: GestureDetector(
                  onTap: onPickAvatar,
                  child: Container(
                    padding: EdgeInsets.all(5.r),
                    decoration: BoxDecoration(
                      color: _lightPrimary, // was Color(0xFFFFF3D6)
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Icon(
                      Icons.camera_alt_rounded,
                      size: 12.sp,
                      color: _primary, // was Color(0xFFB8860B)
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}