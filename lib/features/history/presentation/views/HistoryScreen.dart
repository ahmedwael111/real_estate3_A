
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di.dart';
import '../../../payment/presentation/screens/payment_screen.dart';
import '../cubit/history_cubit.dart';
import '../cubit/history_state.dart';
import 'widgets/OrderCard.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HistoryCubit>(
      create: (_) => getIt<HistoryCubit>()..loadOrders(),
      child: const _HistoryView(),
    );
  }
}

class _HistoryView extends StatelessWidget {
  const _HistoryView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: Text(
          'History',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1E1E1E),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {}, // TODO: edit / filter
            child: Text(
              'Edit',
              style: TextStyle(
                fontSize: 14.sp,
                color: const Color(0xFF1597A8),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<HistoryCubit, HistoryState>(
        builder: (context, state) {
          if (state is HistoryLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFF1597A8)),
            );
          }

          if (state is HistoryError) {
            return _ErrorView(
              message: state.message,
              onRetry: () => context.read<HistoryCubit>().loadOrders(),
            );
          }

          if (state is HistoryEmpty) {
            return const _EmptyView();
          }

          if (state is HistoryLoaded) {
            return RefreshIndicator(
              color: const Color(0xFF1597A8),
              onRefresh: () => context.read<HistoryCubit>().loadOrders(),
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                itemCount: state.orders.length,
                itemBuilder: (context, index) {
                  final order = state.orders[index];
                  return OrderCard(
                    order: order,
                    onPayNow: order.hasPendingPayment
                        ? () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PaymentScreen(
                          url: '',
                        ),
                      ),
                    )
                        : null,
                  );
                },
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.history_outlined,
            size: 72.sp,
            color: const Color(0xFFBDBDBD),
          ),
          SizedBox(height: 16.h),
          Text(
            'No orders yet',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF424242),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Your booking history will appear here',
            style: TextStyle(
              fontSize: 13.sp,
              color: const Color(0xFF9E9E9E),
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 60.sp,
              color: const Color(0xFFEF5350),
            ),
            SizedBox(height: 16.h),
            Text(
              'Something went wrong',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF424242),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.sp,
                color: const Color(0xFF9E9E9E),
              ),
            ),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1597A8),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}
