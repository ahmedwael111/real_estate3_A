import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate3_a/core/di.dart';
import 'package:real_estate3_a/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:real_estate3_a/features/payment/presentation/screens/main_payment_screens.dart';

class PaymentDetailsScreen extends StatefulWidget {
  final int propertyId;

  const PaymentDetailsScreen({super.key, required this.propertyId});

  @override
  State<PaymentDetailsScreen> createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymentCubit>(
      create: (context) => getIt<PaymentCubit>(),
      child: MainPaymentScreens(propertyId: widget.propertyId,),
    );
  }
}
