
import 'package:flutter/material.dart';
import 'package:real_estate3_a/core/utils/app_colors.dart';

class NavButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;

  const NavButton({
    super.key,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration:  BoxDecoration(
          color: AppColors.splashColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}