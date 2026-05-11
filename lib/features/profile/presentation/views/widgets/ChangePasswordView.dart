import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/custom_textformfield.dart';
import '../../cubit/profile_cubit.dart';
import '../../cubit/profile_state.dart';

// ── Theme colors ──────────────────────────────────────────────────────────────
const Color _primary = Color(0xFF1597A8); // teal (replaces 0xffB8860B)

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscureCurrent = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    context.read<ProfileCubit>().changePassword(
      currentPassword: _currentPasswordController.text.trim(),
      newPassword: _newPasswordController.text.trim(),
      passwordConfirmation: _confirmPasswordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAF9F6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded,
              size: 20.sp, color: const Color(0xff1A1A2E)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Change Password',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xff1A1A2E),
          ),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ChangePasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r)),
              ),
            );
            Navigator.pop(context);
          }
          if (state is ChangePasswordError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r)),
              ),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is ChangePasswordLoading;
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Illustration ──────────────────────────────────────
                  Center(
                    child: Container(
                      width: 90.w,
                      height: 90.h,
                      decoration: BoxDecoration(
                        color: _primary.withOpacity(0.1), // was Color(0xffB8860B).withOpacity(0.1)
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.lock_outline_rounded,
                        size: 44.sp,
                        color: _primary, // was Color(0xffB8860B)
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Center(
                    child: Text(
                      'Keep your account secure',
                      style: TextStyle(fontSize: 13.sp, color: Colors.grey[500]),
                    ),
                  ),

                  SizedBox(height: 32.h),

                  // ── Fields ────────────────────────────────────────────
                  CustomTextformfeild(
                    keyboardType: TextInputType.visiblePassword,
                    formFieldKey: UniqueKey(),
                    controller: _currentPasswordController,
                    labelText: 'Current Password',
                    hintText: 'Enter current password',
                    prefixIcon: const Icon(Icons.lock_outline_rounded),
                    isPassword: _obscureCurrent,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureCurrent
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 20.sp,
                        color: Colors.grey[400],
                      ),
                      onPressed: () =>
                          setState(() => _obscureCurrent = !_obscureCurrent),
                    ),
                    validator: (v) => (v == null || v.isEmpty)
                        ? 'Current password is required'
                        : null,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextformfeild(
                    formFieldKey: UniqueKey(),
                    keyboardType: TextInputType.visiblePassword,
                    controller: _newPasswordController,
                    labelText: 'New Password',
                    hintText: 'Min. 8 characters',
                    prefixIcon: const Icon(Icons.lock_reset_rounded),
                    isPassword: _obscureNew,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureNew
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 20.sp,
                        color: Colors.grey[400],
                      ),
                      onPressed: () =>
                          setState(() => _obscureNew = !_obscureNew),
                    ),
                    validator: (v) {
                      if (v == null || v.isEmpty) return 'New password is required';
                      if (v.length < 8) return 'Password must be at least 8 characters';
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),
                  CustomTextformfeild(
                    keyboardType: TextInputType.visiblePassword,
                    formFieldKey: UniqueKey(),
                    controller: _confirmPasswordController,
                    labelText: 'Confirm New Password',
                    hintText: 'Re-enter new password',
                    prefixIcon: const Icon(Icons.check_circle_outline_rounded),
                    isPassword: _obscureConfirm,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirm
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 20.sp,
                        color: Colors.grey[400],
                      ),
                      onPressed: () =>
                          setState(() => _obscureConfirm = !_obscureConfirm),
                    ),
                    validator: (v) {
                      if (v == null || v.isEmpty) return 'Please confirm your new password';
                      if (v != _newPasswordController.text) return 'Passwords do not match';
                      return null;
                    },
                  ),

                  SizedBox(height: 32.h),

                  // ── Submit ────────────────────────────────────────────
                  SizedBox(
                    width: double.infinity,
                    height: 52.h,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : _submit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _primary, // was Color(0xffB8860B)
                        disabledBackgroundColor: _primary.withOpacity(0.6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.r)),
                        elevation: 0,
                      ),
                      child: isLoading
                          ? SizedBox(
                        width: 22.w,
                        height: 22.h,
                        child: const CircularProgressIndicator(
                            color: Colors.white, strokeWidth: 2),
                      )
                          : Text(
                        'Update Password',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}