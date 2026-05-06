import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate3_a/features/Home/presentation/views/home_view1.dart';
import '../../../../core/di.dart';
import '../../../Favorits/domain/repo/favoriteRepo.dart';
import '../../../Favorits/presentation/cubit/favorite_cubit.dart';
import '../../../Favorits/presentation/views/FavoriteView.dart';
import 'widgets/CustomBottomNavigationBar.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);
  static const routename = "mainview";

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // ✅ هنا فوق الاتنين HomeView و FavoriteView
      create: (_) => FavoriteCubit(getIt<FavoriteRepository>())..getFavorites(),
      child: Builder(
        builder: (context) {
          final screens = [
            const HomeView(),
            const FavoriteView(),
          ];

          return Scaffold(
            bottomNavigationBar: Custombottomnavbar(
              currentIndex: currentIndex,
              ontapChanged: (index) {
                setState(() => currentIndex = index);
              },
            ),
            body: SafeArea(
              child: IndexedStack(
                children: screens,
                index: currentIndex,
              ),
            ),
          );
        },
      ),
    );
  }
}