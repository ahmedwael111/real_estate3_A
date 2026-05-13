import '../../domain/entity/OrderHistoryEntity.dart';
import 'package:equatable/equatable.dart';
abstract class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object?> get props => [];
}

class HistoryInitial extends HistoryState {
  const HistoryInitial();
}

class HistoryLoading extends HistoryState {
  const HistoryLoading();
}

class HistoryLoaded extends HistoryState {
  final List<OrderHistoryEntity> orders;

  const HistoryLoaded({required this.orders});

  @override
  List<Object?> get props => [orders];
}

class HistoryEmpty extends HistoryState {
  const HistoryEmpty();
}

class HistoryError extends HistoryState {
  final String message;

  const HistoryError({required this.message});

  @override
  List<Object?> get props => [message];
}