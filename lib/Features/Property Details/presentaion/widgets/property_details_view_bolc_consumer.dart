import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate3_a/Features/Property%20Details/presentaion/cubit/cubit/property%20details%20cubit/property_details_cubit.dart';
import 'package:real_estate3_a/Features/Property%20Details/presentaion/property_details_view_body.dart';
import 'package:real_estate3_a/core/constant/snakbar.dart';

class PropertyDetailsViewBolcConsumer extends StatelessWidget {
  const PropertyDetailsViewBolcConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PropertyDetailsCubit, PropertyDetailsState>(
      listener: (context, state) {
        if (state is PropertyDetailsFailure) {
          CustomSnackbar(Colors.red, state.errorMessage, true).show(context);
        } else if (state is PropertyDetailsSuccess) {
          CustomSnackbar(
            Colors.green,
            'Property details loaded successfully!',
            false,
          ).show(context);
        }
      },
      builder: (context, state) {
        if (state is PropertyDetailsSuccess) {
          return ProperyDetailsViewBody(
            propertyDetailsEntity: state.propertyDetailsEntity,
          );
        }
        if (state is PropertyDetailsFailure) {
          final errorMessage = state.errorMessage;
          return Center(child: Text(errorMessage));
        } else {
          return const Center(
            child: CircularProgressIndicator(color: Colors.red),
          );
        }
      },
    );
  }
}
