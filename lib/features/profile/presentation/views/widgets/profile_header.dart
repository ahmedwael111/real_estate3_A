import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate3_a/core/utils/app_colors.dart';
import 'package:real_estate3_a/features/profile/domain/entity/profileEntity.dart';
import 'CoverPrinter.dart';
import 'edit_chip.dart';

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
                      Color(0xFF6D4C00),
                      Color(0xFFB8860B),
                      Color(0xFFFFD166),
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
                    color: const Color(0xFFFFF8E7),
                    width: 4,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFB8860B).withOpacity(0.25),
                      blurRadius: 18,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 44.r,
                  backgroundColor: const Color(0xFFFFF3D6),
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
                      color:  const Color(0xFFFFF3D6),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Icon(
                      Icons.camera_alt_rounded,
                      size: 12.sp,
                      color:const Color(0xFFB8860B),
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