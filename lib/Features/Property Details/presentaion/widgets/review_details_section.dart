import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate3_a/features/Property%20Details/presentaion/cubit/reviews_property_cubit.dart';
import 'package:real_estate3_a/features/Property%20Details/presentaion/widgets/user_review_view_provider.dart';
import 'package:real_estate3_a/core/constant/cached_image_widget.dart';
import 'package:real_estate3_a/features/Property%20Details/domin/entities/property/property.details.entity.dart';

class ReviewDetailsSection extends StatelessWidget {
  const ReviewDetailsSection({super.key, required this.propertyDetailsEntity, required this.propertyId});
  final PropertyDetailsEntity propertyDetailsEntity;
  final int propertyId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsPropertyCubit, ReviewsPropertyState>(
      builder: (context, state) {
        if (state is ReviewsPropertyLoaded) {
          return Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Header
                GestureDetector(
                  onTap: () {
                    // Navigate to reviews page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UserReviewsViewProvider(
                          propertyDetailsEntity: propertyDetailsEntity,
                          reviews: state.reviews,
                          propertyId: propertyId,
                        ),
                      ),
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "User Reviews",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text("See all", style: TextStyle(color: Colors.teal)),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                /// Rating Row
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 18),
                    SizedBox(width: 4),
                    Text(
                      " ${state.reviews.first.rating?.toDouble() ?? "no rating"}",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(width: 6),
                    Text(
                      '(${state.reviews.length} ratings)',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(width: 10),
                    Text("•", style: TextStyle(color: Colors.grey)),
                    SizedBox(width: 10),
                    Text(
                      '${state.reviews.length} Reviews',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                /// Images Row
                SizedBox(
                  height: 80,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    separatorBuilder: (_, _) => const SizedBox(width: 10),
                    itemBuilder: (context, index) {
                      if (index == 3) {
                        return Stack(
                          children: [
                            _reviewImage(
                              propertyDetailsEntity.images![index].url ?? "",
                            ),
                            Container(
                              width: 120,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                "+25",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      return _reviewImage(
                        propertyDetailsEntity.images![index].url ?? "",
                      );
                    },
                  ),
                ),

                const SizedBox(height: 16),

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
                        imageUrl: state.reviews[0].user?.image ?? '',
                        fit: BoxFit.cover,
                      ),
                    ),

                    SizedBox(width: 10),
                    Text(
                      state.reviews[0].user?.name ?? "Unknown User",
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
                      "${state.reviews.first.rating ?? "no rating"}/5",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(width: 10),
                    Text("1 week ago", style: TextStyle(color: Colors.grey)),
                  ],
                ),

                const SizedBox(height: 12),

                /// Title
                Text(
                  state.reviews.first.comment ?? "No Title",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),

                const SizedBox(height: 8),

                /// Description
                const Text(
                  "This house is beautiful and welcoming. The wraparound porch is a standout feature, perfect for relaxing outdoors. Inside, the large windows make the rooms bright and airy. The yard is spacious and well-kept, with plenty of greenery. Overall, it’s a lovely home that feels both elegant and comfortable.",
                  style: TextStyle(color: Colors.grey, height: 1.4),
                ),
              ],
            ),
          );
        } else if (state is ReviewsPropertyError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  /// Reusable image widget
  Widget _reviewImage(String? url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),

      child: CachedImageWidget(
        imageUrl: url ?? "",
        fit: BoxFit.cover,
        height: 80,
        width: 120,
      ),
    );
  }
}
