import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate3_a/features/Home/presentation/views/home_view1.dart';
import 'package:real_estate3_a/features/Property%20Details/presentaion/property_details_view.dart';
import 'package:real_estate3_a/features/map%20feature/presentation/map_view.dart';
import 'package:real_estate3_a/features/profile/presentation/views/profile_view.dart';
import '../../../../core/di.dart';
import '../../../Favorits/domain/repo/favoriteRepo.dart';
import '../../../Favorits/presentation/cubit/favorite_cubit.dart';
import '../../../Favorits/presentation/views/FavoriteView.dart';
import '../../../history/presentation/views/HistoryScreen.dart';
import 'widgets/CustomBottomNavigationBar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const routename = "mainview";

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavoriteCubit(getIt<FavoriteRepository>())..getFavorites(),
      child: Builder(
        builder: (context) {
          final screens = [
            const HomeView(),
            const FavoriteView(),
            const MapRealStateView(),
            const HistoryScreen(),
            ProfileView(),
          ];

          return Scaffold(
            bottomNavigationBar: Custombottomnavbar(
              currentIndex: currentIndex,
              ontapChanged: (index) {
                setState(() => currentIndex = index);
              },
            ),
            body: IndexedStack(index: currentIndex, children: screens),
          );
        },
      ),
    );
  }
}
