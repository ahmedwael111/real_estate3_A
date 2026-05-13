import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate3_a/core/constant/custom_app_bar.dart';
import 'package:real_estate3_a/core/constant/custom_button.dart';
import 'package:real_estate3_a/core/constant/custom_toast.dart';
import 'package:real_estate3_a/core/utils/app_colors.dart';
import 'package:real_estate3_a/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:real_estate3_a/features/payment/presentation/screens/payment_screen.dart';
import 'package:real_estate3_a/features/payment/presentation/widgets/request_to_book_step_view.dart';

class MainPaymentScreens extends StatelessWidget {
  const MainPaymentScreens({super.key,required this.propertyId});
  final int propertyId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(title: "Request To Book"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: RequestToBookStepView(),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          bottom: 32.h,
          top: 16.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BlocConsumer<PaymentCubit, PaymentState>(
          listener: (context, state) {
            if (state is PaymentError) {

              print(state.message);
              CustomToast.showError(state.message);
            } else if (state is PaymentLoaded) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentScreen(url: state.url),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is PaymentLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return CustomButton(
              data: "Create Order",
              color: AppColors.teal,
              bordercolor: AppColors.teal,
              onTap: () async {
                await context.read<PaymentCubit>().createOrder(propertyId);
              },
              fontSize: 14.sp,
            );
          },
        ),
      ),
    );
  }
}
