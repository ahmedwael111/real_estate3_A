import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate3_a/features/Property%20Details/domin/entities/user/user.reveiw.enitity.dart';
import 'package:real_estate3_a/features/Property%20Details/domin/repos/propety_details_repo.dart';
import 'package:real_estate3_a/features/Property%20Details/presentaion/cubit/reviews_property_cubit.dart';
import 'package:real_estate3_a/features/Property%20Details/presentaion/user_reviews_view.dart';
import 'package:real_estate3_a/core/di.dart';
import 'package:real_estate3_a/features/Property%20Details/domin/entities/property/property.details.entity.dart';


class UserReviewsViewProvider extends StatelessWidget {
  const UserReviewsViewProvider({
    super.key,
    required this.propertyDetailsEntity, required this.reviews, required this.propertyId,
  });
  final PropertyDetailsEntity propertyDetailsEntity;
  final List<UserReviewEnitity> reviews;
  final int propertyId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReviewsPropertyCubit>(
      create: (context) => ReviewsPropertyCubit(
        propertyDetailsRepo: getIt<PropertyDetailsRepo>(),
      )..fetchReviewsProperty(propertyId),
      child: UserReviewScreen(propertyDetailsEntity: propertyDetailsEntity, reviews: reviews),
    );
  }
}
