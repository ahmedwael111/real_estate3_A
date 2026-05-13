

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate3_a/features/history/data/repo/HistoryRepositoryImpl.dart';
import 'package:real_estate3_a/features/history/domain/repo/HistoryRepository.dart';

import 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final HistoryRepository getOrdersrepo;

  HistoryCubit({required this.getOrdersrepo}) : super(const HistoryInitial());

  Future<void> loadOrders() async {
    emit(const HistoryLoading());

    final result = await getOrdersrepo.getOrders();

    result.fold(
          (failure) => emit(HistoryError(message: failure.message)),
          (orders) {
        if (orders.isEmpty) {
          emit(const HistoryEmpty());
        } else {
          emit(HistoryLoaded(orders: orders));
        }
      },
    );
  }
}
