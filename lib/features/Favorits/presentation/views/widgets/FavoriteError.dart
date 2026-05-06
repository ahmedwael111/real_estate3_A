
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/favorite_cubit.dart';

class FavoriteError extends StatelessWidget {
  final String message;

  const FavoriteError({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(message),
          ElevatedButton(
            onPressed: () =>
                context.read<FavoriteCubit>().getFavorites(),
            child: const Text("Retry"),
          ),
        ],
      ),
    );
  }
}