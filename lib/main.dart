import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate3_a/core/bloc%20observe/bloc_service.dart';
import 'package:real_estate3_a/core/di.dart';
import 'package:real_estate3_a/features/Home/presentation/views/MainView.dart';
import 'package:real_estate3_a/features/splash/presentation/views/splash_view.dart';

import 'features/Home/domain/repo/HomeRepo.dart';
import 'features/Home/presentation/home_cubit/home_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initAppModule();
  Bloc.observer = MyBlocObserver();
  runApp(const RealStateApp3A());
}

class RealStateApp3A extends StatelessWidget {
  const RealStateApp3A({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(402, 874),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (_) => HomeCubit(getIt<HomeRepository>()),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Real Estate 3A',
            theme: ThemeData(
              scaffoldBackgroundColor: Color(0xffFAF9F6),
              primarySwatch: Colors.blue,
            ),
            home: const SplashView(),
          ),
        );
      },
    );
  }
}
