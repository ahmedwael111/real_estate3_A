import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate3_a/Features/payment/presentation/screens/payment_details_screen.dart';
import 'package:real_estate3_a/features/payment/presentation/cubit/payment_cubit.dart';

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
      create: (context) => context.read<PaymentCubit>(),
      child: MainPaymentScreens(),
    );
  }
}
