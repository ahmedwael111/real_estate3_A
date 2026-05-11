import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate3_a/features/Favorits/presentation/views/widgets/favoriteBody.dart';
import '../../../../core/di.dart';
import '../../domain/repo/favoriteRepo.dart';
import '../cubit/favorite_cubit.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const FavoriteBody();
  }
}
