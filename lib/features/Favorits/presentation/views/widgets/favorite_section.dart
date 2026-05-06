
import 'package:flutter/material.dart';
import 'package:real_estate3_a/features/Favorits/presentation/views/widgets/FavoriteList.dart';
import 'package:real_estate3_a/features/Favorits/presentation/views/widgets/SectionHeader.dart';

import '../../../domain/entities/favoriteEntity.dart';
import '../../cubit/favorite_state.dart';

class FavoriteSection extends StatelessWidget {
  final String categoryName;
  final List<FavoriteEntity> items;
  final FavoriteState state;

  const FavoriteSection({
    super.key,
    required this.categoryName,
    required this.items,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: categoryName,
          count: items.length,
        ),
        FavoriteList(items: items, state: state),
      ],
    );
  }
}