import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate3_a/core/di.dart';
import 'package:real_estate3_a/features/profile/domain/repo/profileRepo.dart';
import 'package:real_estate3_a/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:real_estate3_a/features/profile/presentation/views/widgets/ProfileBlocConsumer.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return ProfileCubit(profileRepository: getIt<ProfileRepository>());
        },
        child: ProfileBlocConsumer(),
      ),
    );
  }
}
