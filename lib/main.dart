import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate3_a/core/di.dart';
import 'package:real_estate3_a/features/splash/presentation/views/splash_view.dart';

void main() {
  initAppModule();
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
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Real Estate 3A',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const SplashView(),
        );
      },
    );
  }
}