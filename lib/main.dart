import 'package:flutter/material.dart';
import 'package:real_estate3_a/Features/Property%20Details/presentaion/property_details_view.dart';
import 'package:real_estate3_a/core/di.dart';

void main() {
  initAppModule();
  runApp(const RealStateApp3A());
}

class RealStateApp3A extends StatelessWidget {
  const RealStateApp3A({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real Estate 3A',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PropertyDetailsView(),
    );
  }
}
