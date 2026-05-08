import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate3_a/Features/Property%20Details/presentaion/cubit/reviews_property_cubit.dart';
import 'package:real_estate3_a/Features/Property%20Details/presentaion/user_reviews_view.dart';
import 'package:real_estate3_a/Features/Property%20Details/presentation/user_reviews_view.dart';

import '../../domin/entities/property/property.details.entity.dart';

class UserReviewsViewProvider extends StatelessWidget {
  const UserReviewsViewProvider({super.key, required this.propertyDetailsEntity});
  final PropertyDetailsEntity propertyDetailsEntity;

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => ReviewsPropertyCubit( 
        propertyDetailsRepo: context.read(),
      )..fetchReviewsProperty(5),
      child: UserReviewScreen( propertyDetailsEntity: propertyDetailsEntity),
    );
  }
}