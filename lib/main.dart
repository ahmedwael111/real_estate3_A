import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate3_a/Features/Property%20Details/presentaion/property_details_view.dart';
import 'package:real_estate3_a/core/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(const RealStateApp3A());
}

class RealStateApp3A extends StatelessWidget {
  const RealStateApp3A({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Standard design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Real Estate 3A',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: PropertyDetailsView(),
        );
      },
    );
  }
}
