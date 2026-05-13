import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate3_a/features/payment/domain/entities/order_entity.dart';
import 'package:real_estate3_a/features/payment/domain/usecases/create_order_usecase.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final CreateOrderUseCase createOrderUseCase;

  PaymentCubit({required this.createOrderUseCase}) : super(PaymentInitial());

  Future<void> createOrder(int propertyId) async {
    emit(PaymentLoading());

    final result = await createOrderUseCase(propertyId);

    result.fold(
      (failure) => emit(PaymentError(message: failure.message)),
      (url) => emit(PaymentLoaded(url: url ??"")),
    );
  }
}
