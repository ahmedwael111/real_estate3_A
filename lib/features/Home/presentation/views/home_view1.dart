import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate3_a/features/Home/presentation/views/widgets/Home_Content.dart';
import '../../../../core/di.dart';
import '../../../Favorits/domain/repo/favoriteRepo.dart';
import '../../../Favorits/presentation/cubit/favorite_cubit.dart';
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

class HomeViewBody extends StatefulWidget {
  const HomeViewBody();

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF2EC4B6),
              ),
            );
          }

          if (state is HomeError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wifi_off_rounded,
                      size: 48.r, color: const Color(0xFF9CA3AF)),
                  SizedBox(height: 12.h),
                  Text(
                    state.message,
                    style: TextStyle(
                        fontSize: 14.sp, color: const Color(0xFF6B7280)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<HomeCubit>().getHomeData(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2EC4B6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text('Retry',
                        style: TextStyle(fontSize: 14.sp)),
                  ),
                ],
              ),
            );
          }

          if (state is HomeLoaded) {


              return HomeContent();
          }

          return const SizedBox.shrink();
        },
      ),
  );}

  }
