import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_estate3_a/features/profile/domain/entity/profileEntity.dart';
import 'package:real_estate3_a/features/profile/presentation/cubit/profile_state.dart';
import 'package:real_estate3_a/features/profile/presentation/views/widgets/personalInfoSheet.dart';
import 'package:real_estate3_a/features/profile/presentation/views/widgets/profileNameRow.dart';
import 'package:real_estate3_a/features/profile/presentation/views/widgets/profile_header.dart';

import '../../cubit/profile_cubit.dart';
import 'ChangePasswordView.dart';
import 'EditProfileView.dart';
import 'Language_sheet.dart';
import 'Notification_Sheet.dart';
import 'ProfileMenuItem.dart';
import 'ToggleMenuItem.dart';
import 'Language_menu.dart';

const Color _primary = Color(0xFF1597A8);
const Color _dark = Color(0xFF0D2B30);

class ProfileViewBody1 extends StatefulWidget {
  const ProfileViewBody1({
    super.key,
    required this.state,
    required this.profile,
  });

  final ProfileState state;
  final ProfileEntity profile;

  @override
  State<ProfileViewBody1> createState() => _ProfileViewBody1State();
}

class _ProfileViewBody1State extends State<ProfileViewBody1> {
  File? _coverImage;
  File? _avatarImage;
  bool _lightMode = true;
  String _selectedLang = 'en';

  @override
  Widget build(BuildContext context) {
    final profile = widget.profile;
    final state = widget.state;

    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 160.h + 44.r + 4,
                child: ProfileHeaderCard(
                  profile: profile,
                  coverImage: _coverImage,
                  avatarImage: _avatarImage,
                  onPickCover: () => _pickImage(isCover: true),
                  onPickAvatar: () => _pickImage(isCover: false),
                ),
              ),


              ProfileNameRow(
                name: profile.name,
                email: profile.email,
                role: profile.role,
                onEditTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: context.read<ProfileCubit>(),
                      child: EditProfileView(profile: profile),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.h),
              Divider(height: 1, thickness: 1, color: Colors.grey.shade200),
              SizedBox(height: 20.h),

              // ── Account Setting ────────────────────────────────────
              _SectionLabel(label: 'Account Setting'),
              SizedBox(height: 10.h),
              _MenuCard(
                children: [
                  ProfileMenuItem(
                    icon: Icons.badge_outlined,
                    title: 'Personal Information',
                    subtitle: 'View your name, email & role',
                    onTap: () => _showPersonalInfoSheet(context, profile),
                  ),
                  _Divider(),
                  ProfileMenuItem(
                    icon: Icons.manage_accounts_outlined,
                    title: 'My Account',
                    subtitle: 'Edit your profile details',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: context.read<ProfileCubit>(),
                          child: EditProfileView(profile: profile),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),
              _SectionLabel(label: 'payment method'),
              SizedBox(height: 10.h),
              _MenuCard(children:[
                ProfileMenuItem(
                  icon: Icons.lock_outline_rounded,
                  title: 'Payment Method',
                  subtitle: 'select your payment menthod',
                  onTap: (){}
                ),
              ] ),
              SizedBox(height: 20.h),

              // ── Setting & Security ─────────────────────────────────
              _SectionLabel(label: 'Setting & Security'),
              SizedBox(height: 10.h),
              _MenuCard(
                children: [
                  ProfileMenuItem(
                    icon: Icons.lock_outline_rounded,
                    title: 'Change Password',
                    subtitle: 'Update your account password',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: context.read<ProfileCubit>(),
                          child: const ChangePasswordView(),
                        ),
                      ),
                    ),
                  ),
                  _Divider(),
                  ProfileMenuItem(
                    icon: Icons.notifications_outlined,
                    title: 'Notification Preference',
                    subtitle: 'Manage your notification settings',
                    onTap: () => _showNotificationSheet(context),
                  ),
                  _Divider(),
                  ToggleMenuItem(
                    icon: Icons.wb_sunny_outlined,
                    title: 'Light Mode',
                    subtitle: _lightMode
                        ? 'Currently light theme'
                        : 'Currently dark theme',
                    value: _lightMode,
                    onChanged: (val) => setState(() => _lightMode = val),
                  ),
                  _Divider(),
                  LanguageMenuItem(
                    selectedCode: _selectedLang,
                    onTap: () => _showLanguagePicker(context),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              // ── Logout ─────────────────────────────────────────────
              _MenuCard(
                children: [
                  ProfileMenuItem(
                    icon: Icons.logout_rounded,
                    title: 'Log out',
                    subtitle: 'Sign out of your account',
                    iconColor: const Color(0xFFE53935),
                    isLoading: state is LogoutLoading,
                    onTap: () => context.read<ProfileCubit>().logout(),
                  ),
                ],
              ),

              SizedBox(height: 36.h),
            ],
          ),
        ),
      ),
    );
  }

  // ── Helpers ────────────────────────────────────────────────────────────────

  void _showPersonalInfoSheet(BuildContext context, ProfileEntity profile) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => PersonalInfoSheet(profile: profile),
    );
  }

  void _showNotificationSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const NotificationSheet(),
    );
  }

  void _showLanguagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => LanguageSheet(
        selectedCode: _selectedLang,
        onSelect: (code) {
          setState(() => _selectedLang = code);
          Navigator.pop(context);
        },
      ),
    );
  }

  Future<void> _pickImage({required bool isCover}) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );
    if (picked == null) return;
    setState(() {
      if (isCover) {
        _coverImage = File(picked.path);
      } else {
        _avatarImage = File(picked.path);
      }
    });
  }
}

// ── Shared small widgets ──────────────────────────────────────────────────────

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Divider(
    height: 1,
    thickness: 1,
    indent: 72.w,
    color: Colors.grey.shade100,
  );
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    child: Text(
      label,
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
        color: const Color(0xffB8860B),
        letterSpacing: 1.0,
      ),
    ),
  );
}

class _MenuCard extends StatelessWidget {
  const _MenuCard({required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: _primary.withOpacity(0.07),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(children: children),
    ),
  );
}