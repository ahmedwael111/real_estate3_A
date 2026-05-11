import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ReviewShimmerScreen extends StatelessWidget {
  const ReviewShimmerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          children: [
            const _HeaderShimmer(),

            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const _ReviewItemShimmer();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ================= HEADER =================
class _HeaderShimmer extends StatelessWidget {
  const _HeaderShimmer();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _circle(),
              Container(width: 100, height: 14, color: Colors.white),
              _circle(),
            ],
          ),

          const SizedBox(height: 32),

          Row(
            children: [
              Container(width: 20, height: 20, color: Colors.white),
              const SizedBox(width: 8),
              Container(width: 60, height: 14, color: Colors.white),
              const SizedBox(width: 10),
              Container(width: 120, height: 12, color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }

  Widget _circle() {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );
  }
}

/// ================= REVIEW ITEM =================
class _ReviewItemShimmer extends StatelessWidget {
  const _ReviewItemShimmer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// user
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              Container(width: 120, height: 12, color: Colors.white),
            ],
          ),

          const SizedBox(height: 12),

          /// stars
          Row(
            children: List.generate(
              5,
                  (index) => Container(
                margin: const EdgeInsets.only(right: 4),
                width: 16,
                height: 16,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 12),

          /// text
          Container(width: double.infinity, height: 14, color: Colors.white),
          const SizedBox(height: 8),
          Container(width: double.infinity * 0.8, height: 14, color: Colors.white),

          const SizedBox(height: 12),

          /// images
          Row(
            children: List.generate(
              3,
                  (index) => Container(
                margin: const EdgeInsets.only(right: 8),
                width: 78,
                height: 88,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}