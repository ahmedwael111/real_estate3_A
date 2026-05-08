import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate3_a/Features/Property%20Details/domin/repos/propety_details_repo.dart';
import 'package:real_estate3_a/Features/Property%20Details/presentaion/cubit/cubit/property%20details%20cubit/property_details_cubit.dart';
import 'package:real_estate3_a/Features/Property%20Details/presentaion/cubit/reviews_property_cubit.dart';
import 'package:real_estate3_a/Features/Property%20Details/presentaion/widgets/property_details_view_bolc_consumer.dart';


import 'package:real_estate3_a/core/di.dart';

import 'cubit/cubit/similar_property_details_cubit.dart';

class PropertyDetailsView extends StatelessWidget {
  const PropertyDetailsView({super.key});
  //  final String propertyId = '1';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PropertyDetailsCubit>(
          create: (context) => PropertyDetailsCubit(
            propertyDetailsRepo: getIt<PropertyDetailsRepo>(),
          )..getPropertyDetails(5),
        ),
        BlocProvider<SimilarPropertyDetailsCubit>(
          create: (context) => SimilarPropertyDetailsCubit(
            propertyDetailsRepo: getIt<PropertyDetailsRepo>(),
          )..fetchSimilarPropertyDetails(5),
        ),
        BlocProvider<ReviewsPropertyCubit>(
          create: (context) => ReviewsPropertyCubit(
            propertyDetailsRepo: getIt<PropertyDetailsRepo>(),
          )..fetchReviewsProperty(5),
        ),
      ],
      child: Scaffold(body: const PropertyDetailsViewBolcConsumer()),
    );
  }
}
