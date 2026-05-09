import 'package:flutter/material.dart';

import 'package:real_estate3_a/core/constant/cached_image_widget.dart';
import 'package:real_estate3_a/core/constant/custom_button.dart';

class View360Screen extends StatelessWidget {
  const View360Screen({super.key, required this.imageUrls});
  final List<String> imageUrls;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          BackgroundImage(imageUrl: imageUrls[3]),

          // Content فوق الصورة
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 16),
                const CustomHeader(),

                const SizedBox(height: 20),
                const ChipsSection(),
                const Spacer(),
                const BottomToggle(),
                const SizedBox(height: 20),
              ],
            ),
          ),

          // Floating Controls
          const Positioned(right: 16, bottom: 120, child: ZoomControls()),

          const Center(child: RotateIcon()),
        ],
      ),
    );
  }
}

//// ================= BACKGROUND =================

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: InteractiveViewer(
        minScale: 1.0,
        maxScale: 6.0,

        // 👇 هنا بتمسك الـ 404 وبتمنع ال spam
        onInteractionUpdate: (details) {},

        child: CachedImageWidget(imageUrl: imageUrl, fit: BoxFit.cover),
      ),
    );
  }
}

//// ================= HEADER =================

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.7),
            child: const Icon(Icons.arrow_back, color: Colors.black),
          ),
          const Spacer(),
          const Text(
            "360 View",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const Spacer(),
          const SizedBox(width: 40), // balance
        ],
      ),
    );
  }
}

//// ================= CHIPS =================

class ChipsSection extends StatelessWidget {
  const ChipsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: const [
          CustomChip(title: "Front Page", isSelected: true),
          CustomChip(title: "Back Page"),
          CustomChip(title: "Side Page"),
        ],
      ),
    );
  }
}

class CustomChip extends StatelessWidget {
  final String title;
  final bool isSelected;

  const CustomChip({super.key, required this.title, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFF1597A8) : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(16),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(color: isSelected ? Colors.white : Colors.black),
      ),
    );
  }
}

//// ================= CENTER ICON =================

class RotateIcon extends StatelessWidget {
  const RotateIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 28,
      backgroundColor: Colors.black.withOpacity(0.4),
      child: const Icon(Icons.rotate_90_degrees_ccw, color: Colors.white),
    );
  }
}

//// ================= ZOOM CONTROLS =================

class ZoomControls extends StatelessWidget {
  const ZoomControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildButton(Icons.add),
        const SizedBox(height: 10),
        _buildButton(Icons.remove),
      ],
    );
  }

  Widget _buildButton(IconData icon) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon),
    );
  }
}

//// ================= BOTTOM TOGGLE =================

class BottomToggle extends StatelessWidget {
  const BottomToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 16),
        Expanded(
          child: CustomButton(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (_) => const PropertyDetailstext(),
              //   ),
              // );
            },
            data: "Outdoor",
            color: Color(0xFF1597A8),
            txtcolor: Color(0xFFF8F8F8),
            fontSize: 20,
            bordercolor: Color(0xFF1597A8),
            borderRadius: 20,
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: CustomButton(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (_) => const View360Screen(),
              //   ),
              // );
            },
            data: "Indoor",
            color: Color(0xFFBFF8FF),
            txtcolor: Color(0xFF1597A8),
            fontSize: 20,
            bordercolor: Color(0xFFBFF8FF),
            borderRadius: 20,
          ),
        ),
        SizedBox(width: 16),
      ],
    );
  }
}
