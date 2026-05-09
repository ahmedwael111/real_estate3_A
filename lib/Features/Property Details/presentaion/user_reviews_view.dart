import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate3_a/features/Property%20Details/domin/entities/user/user.reveiw.enitity.dart';
import 'package:real_estate3_a/features/Property%20Details/presentaion/cubit/reviews_property_cubit.dart';
import 'package:real_estate3_a/features/Property%20Details/presentaion/property_details_view_body.dart';
import 'package:real_estate3_a/core/constant/cached_image_widget.dart';

import 'package:real_estate3_a/core/constant/snakbar.dart';
import 'package:real_estate3_a/features/Property%20Details/domin/entities/property/property.details.entity.dart';

class UserReviewScreen extends StatelessWidget {
  const UserReviewScreen({
    super.key,
    required this.propertyDetailsEntity,
    required this.reviews,
  });
  final PropertyDetailsEntity propertyDetailsEntity;
  final List<UserReviewEnitity> reviews;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReviewsPropertyCubit, ReviewsPropertyState>(
      listener: (context, state) {
        if (state is ReviewsPropertyError) {
          CustomSnackbar(Colors.red, state.message, true).show(context);
        } else if (state is ReviewsPropertyLoaded) {
          CustomSnackbar(
            Colors.green,
            'Reviews loaded successfully!',
            true,
          ).show(context);
        }
      },
      builder: (context, state) {
        if (state is ReviewsPropertyLoaded) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  CustomReviewAppBar(reviews: reviews),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.reviews.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return RatingSummary(
                          userReviewEntity: state.reviews[index],
                          propertyDetailsEntity: propertyDetailsEntity,
                        );
                      },
                    ),
                  ),
                  BottomButtons(propertyDetailsEntity: propertyDetailsEntity),
                ],
              ),
            ),
          );
        } else if (state is ReviewsPropertyError) {
          return Scaffold(body: Center(child: Text(state.message)));
        } else {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}

// class CustomUserReviewAppBar extends StatelessWidget {
//   const CustomUserReviewAppBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

class RatingSummary extends StatelessWidget {
  final bool isSecond;

  const RatingSummary({
    super.key,
    this.isSecond = false,
    required this.userReviewEntity,
    required this.propertyDetailsEntity,
  });
  final UserReviewEnitity userReviewEntity;
  final PropertyDetailsEntity propertyDetailsEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// User Info
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey),
                ),
                child: CachedImageWidget(
                  imageUrl: userReviewEntity.user?.image ?? '',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              Text(
                userReviewEntity.user?.name ?? ' unknown user ',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),

          const SizedBox(height: 10),

          /// Stars + Time
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 18),
              Icon(Icons.star, color: Colors.amber, size: 18),
              Icon(Icons.star, color: Colors.amber, size: 18),
              Icon(Icons.star, color: Colors.amber, size: 18),
              Icon(Icons.star, color: Colors.amber, size: 18),
              SizedBox(width: 8),
              Text(
                "${userReviewEntity.rating ?? 'no rating'} /5",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(width: 10),
              Text("1 week ago", style: TextStyle(color: Colors.grey)),
            ],
          ),

          const SizedBox(height: 12),

          /// Title
          Text(
            userReviewEntity.comment ?? 'No Title',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),

          const SizedBox(height: 8),

          /// Description
          const Text(
            "This house is beautiful and welcoming. The wraparound porch is a standout feature, perfect for relaxing outdoors. Inside, the large windows make the rooms bright and airy. The yard is spacious and well-kept, with plenty of greenery. Overall, it’s a lovely home that feels both elegant and comfortable.",
            style: TextStyle(color: Colors.grey, height: 1.4),
          ),
          const SizedBox(height: 10),
          Row(
            children: List.generate(
              3,
              (index) => Container(
                margin: const EdgeInsets.only(right: 8),
                width: 78,
                height: 88,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CachedImageWidget(
                  imageUrl: propertyDetailsEntity.images?[index].url ?? "",
                  fit: BoxFit.cover,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: const [
              Icon(Icons.thumb_up_alt_outlined, size: 16),
              SizedBox(width: 5),
              Text("2 people helped"),
              Spacer(),
              Text("View Reply"),
              Icon(Icons.keyboard_arrow_down),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomReviewAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomReviewAppBar({super.key, required this.reviews});
  final List<UserReviewEnitity> reviews;

  @override
  Size get preferredSize => const Size.fromHeight(120);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0.5,
      shadowColor: Colors.black,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 16),

              /// Top Row (Back - Title - Bell)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _circleIcon(
                    Icons.arrow_back,
                    ontap: () => Navigator.pop(context),
                  ),
                  const Text(
                    "User Review",
                    style: TextStyle(
                      color: Color(0xFF1E1E1E),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  _circleIcon(Icons.notifications_none),
                ],
              ),

              const SizedBox(height: 32),

              /// Rating Row
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.orange, size: 20),
                  const SizedBox(width: 6),
                  Text(
                    "${reviews.first.rating?.toDouble() ?? "no rating"}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  Text("/5.0", style: TextStyle(color: Colors.grey)),
                  const SizedBox(width: 10),
                  Text(
                    "${reviews.length} Rating",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(width: 6),
                  const Text("•", style: TextStyle(color: Colors.grey)),
                  const SizedBox(width: 6),
                  Text(
                    "${reviews.length} Reviews",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _circleIcon(IconData icon, {VoidCallback? ontap}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black),
        ),
        child: Icon(icon, size: 24),
      ),
    );
  }
}
