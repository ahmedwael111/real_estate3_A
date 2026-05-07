import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../generated/assets.dart';
import '../../../../Favorits/presentation/cubit/favorite_cubit.dart';
import '../../../../Favorits/presentation/cubit/favorite_state.dart';

class FavButton extends StatelessWidget {
  final int propertyId;
  const FavButton({super.key, required this.propertyId});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FavoriteCubit>();

    return BlocBuilder<FavoriteCubit, FavoriteState>(
      bloc: cubit,

      buildWhen: (previous, current) {
        final prevIsFav = _isFav(previous, propertyId);
        final currIsFav = _isFav(current, propertyId);
        final prevLoading = _isLoading(previous, propertyId);
        final currLoading = _isLoading(current, propertyId);

        return prevIsFav != currIsFav || prevLoading != currLoading;
      },

      builder: (context, state) {
        final isFav = cubit.isFavorite(propertyId);
        final isLoading = state is FavoriteActionLoading &&
            state.loadingPropertyId == propertyId;

        return GestureDetector(
          onTap: isLoading ? null : () => cubit.toggleFavorite(propertyId),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchInCurve: Curves.elasticOut,
            switchOutCurve: Curves.easeIn,
            transitionBuilder: (child, animation) => ScaleTransition(
              scale: animation,
              child: child,
            ),
            child: isLoading
          ? _PulsingHeart(
          key: const ValueKey('loading'),
          isFav: isFav,
        )
            : SvgPicture.asset(
        isFav ?

            Assets.assetsFavProperty :Assets.assetsFavProperty  ,
        key: ValueKey(isFav),
        width: 20.w,
        height: 20.h,
             colorFilter: ColorFilter.mode(
            isFav ? Colors.amberAccent : const Color(0xFF9CA3AF),
            BlendMode.srcIn,
          ),
        ),
          ),
        );
      },
    );
  }

  // ✅ Helper functions خارج الـ build
  bool _isFav(FavoriteState state, int id) {
    if (state is FavoriteLoaded) return state.favoriteIds.contains(id);
    if (state is FavoriteActionLoading) return state.favoriteIds.contains(id);
    return false;
  }

  bool _isLoading(FavoriteState state, int id) {
    return state is FavoriteActionLoading && state.loadingPropertyId == id;
  }
}

class _PulsingHeart extends StatefulWidget {
  final bool isFav;
  const _PulsingHeart({super.key, required this.isFav});

  @override
  State<_PulsingHeart> createState() => _PulsingHeartState();
}

class _PulsingHeartState extends State<_PulsingHeart>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..repeat(reverse: true);

    _scale = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scale,
      child: SvgPicture.asset(
        widget.isFav ?

             Assets.assetsFavProperty :Assets.assetsFavProperty,
        width: 20.w,
        height: 20.h,
        colorFilter: ColorFilter.mode(
          widget.isFav
              ? Colors.amberAccent.withOpacity(0.6)
              : const Color(0xFF9CA3AF).withOpacity(0.6),
          BlendMode.srcIn,
        ),
      ),
    );
  }
}