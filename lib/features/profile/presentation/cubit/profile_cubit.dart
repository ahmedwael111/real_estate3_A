import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate3_a/features/profile/domain/repo/profileRepo.dart';

import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository profileRepository;

  ProfileCubit({required this.profileRepository}) : super(ProfileInitial());

  Future<void> getProfile() async {
    emit(ProfileLoading());
    final result = await profileRepository.getProfile();
    result.fold(
      (error) => emit(ProfileError(error)),
      (profile) => emit(ProfileLoaded(profile)),
    );
  }

  Future<void> updateProfile({
    required String name,
    required String location,
    required String phone,
  }) async {
    emit(UpdateProfileLoading());
    final result = await profileRepository.updateProfile(
      name: name,
      location: location,
      phone: phone,
    );

    result.fold(
      (error) => emit(UpdateProfileError(error)),
      ( profile) => emit(UpdateProfileSuccess(profile )),
    );
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String passwordConfirmation,
  }) async {
    emit(ChangePasswordLoading());
    final result = await profileRepository.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
      passwordConfirmation: passwordConfirmation,
    );
    result.fold(
      (error) => emit(ChangePasswordError(error)),
      (message) => emit(ChangePasswordSuccess(message)),
    );
  }

  Future<void> logout() async {
    emit(LogoutLoading());
    final result = await profileRepository.logout();
    result.fold(
      (error) => emit(LogoutError(error)),
      (message) => emit(LogoutSuccess(message)),
    );
  }
}
