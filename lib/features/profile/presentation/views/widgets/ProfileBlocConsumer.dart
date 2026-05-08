import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate3_a/features/profile/presentation/views/widgets/profileViewBody.dart';

import '../../cubit/profile_cubit.dart';
import '../../cubit/profile_state.dart';


class ProfileBlocConsumer extends StatefulWidget {
  const ProfileBlocConsumer({super.key});

  @override
  State<ProfileBlocConsumer> createState() =>
      _ProfileBlocConsumerState();
}

class _ProfileBlocConsumerState
    extends State<ProfileBlocConsumer> {

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {

        if (state is LogoutSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.green,
            ),
          );
        }

        if (state is LogoutError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }

        if (state is UpdateProfileSuccess) {
          context.read<ProfileCubit>().getProfile();
        }
      },

      builder: (context, state) {

        if (state is ProfileLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ProfileError) {
          return Center(
            child: Text(state.message),
          );
        }

        final profile = state is ProfileLoaded
            ? state.profile
            : state is UpdateProfileSuccess
            ? state.profile
            : null;
        if (profile == null) {
          return const SizedBox();
        }
        return ProfileViewBody1(
          profile: profile, state: state,
        );
      },
    );
  }
}