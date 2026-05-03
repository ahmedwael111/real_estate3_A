import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/home_dateEntity.dart';
import '../../domain/repo/HomeRepo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository;

  HomeCubit(this._homeRepository) : super(HomeInitial());

  Future<void> getHomeData() async {
    emit(HomeLoading());

    final result = await _homeRepository.getHomeData();

    result.fold(
          (failure) => emit(HomeError(message: failure.message)),
          (data) => emit(HomeLoaded(homeData: data)),
    );
  }
}