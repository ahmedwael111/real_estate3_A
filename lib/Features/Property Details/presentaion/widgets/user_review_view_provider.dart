import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate3_a/Features/Property%20Details/domin/entities/user/user.reveiw.enitity.dart';
import 'package:real_estate3_a/Features/Property%20Details/domin/repos/propety_details_repo.dart';
import 'package:real_estate3_a/Features/Property%20Details/presentaion/cubit/reviews_property_cubit.dart';
import 'package:real_estate3_a/Features/Property%20Details/presentaion/user_reviews_view.dart';
import 'package:real_estate3_a/core/di.dart';

import '../../domin/entities/property/property.details.entity.dart';

class UserReviewsViewProvider extends StatelessWidget {
  const UserReviewsViewProvider({
    super.key,
    required this.propertyDetailsEntity, required this.reviews,
  });
  final PropertyDetailsEntity propertyDetailsEntity;
  final List<UserReviewEnitity> reviews;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReviewsPropertyCubit>(
      create: (context) => ReviewsPropertyCubit(
        propertyDetailsRepo: getIt<PropertyDetailsRepo>(),
      )..fetchReviewsProperty(5),
      child: UserReviewScreen(propertyDetailsEntity: propertyDetailsEntity, reviews: reviews),
    );
  }
}
