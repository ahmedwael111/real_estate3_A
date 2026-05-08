import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate3_a/features/Home/presentation/views/widgets/homeViewBody.dart';
import '../../../../core/di.dart';
import '../../domain/repo/HomeRepo.dart';
import '../home_cubit/home_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeCubit(getIt<HomeRepository>())..getHomeData(),
        ),
      ],
      child: const HomeViewBody(),
    );
  }
}

