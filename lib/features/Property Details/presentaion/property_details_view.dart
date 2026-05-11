import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate3_a/features/Property%20Details/domin/repos/propety_details_repo.dart';
import 'package:real_estate3_a/features/Property%20Details/presentaion/cubit/cubit/property%20details%20cubit/property_details_cubit.dart';
import 'package:real_estate3_a/features/Property%20Details/presentaion/cubit/reviews_property_cubit.dart';
import 'package:real_estate3_a/features/Property%20Details/presentaion/widgets/property_details_view_bolc_consumer.dart';

import 'package:real_estate3_a/core/di.dart';

import 'cubit/cubit/similar_property_details_cubit.dart';

class PropertyDetailsView extends StatelessWidget {
  const PropertyDetailsView({super.key, required this.propertyId});
  final int propertyId;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PropertyDetailsCubit>(
          create: (context) => PropertyDetailsCubit(
            propertyDetailsRepo: getIt<PropertyDetailsRepo>(),
          )..getPropertyDetails(propertyId),
        ),
        BlocProvider<SimilarPropertyDetailsCubit>(
          create: (context) => SimilarPropertyDetailsCubit(
            propertyDetailsRepo: getIt<PropertyDetailsRepo>(),
          )..fetchSimilarPropertyDetails(propertyId),
        ),
        BlocProvider<ReviewsPropertyCubit>(
          create: (context) => ReviewsPropertyCubit(
            propertyDetailsRepo: getIt<PropertyDetailsRepo>(),
          )..fetchReviewsProperty(propertyId),
        ),
      ],
      child: Scaffold(body:  PropertyDetailsViewBolcConsumer( propertyId: propertyId, )),
    );
  }
}
