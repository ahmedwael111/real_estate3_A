


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate3_a/core/utils/app_colors.dart';

class NotificationSheet extends StatefulWidget {
  const NotificationSheet();

  @override
  State<NotificationSheet> createState() => _NotificationSheetState();
}
class _NotificationSheetState extends State<NotificationSheet> {
  bool _pushEnabled = true;
  bool _emailEnabled = false;
  bool _smsEnabled = true;

  Widget _toggle(String title, String subtitle, bool value, ValueChanged<bool> onChanged) =>
      Padding(
        padding: EdgeInsets.symmetric(vertical: 6.h),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkprimarycolor)),
                  Text(subtitle,
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey[500])),
                ],
              ),
            ),
            Switch(
              value: value,
              onChanged: onChanged,
              activeColor: Colors.white,
              activeTrackColor: AppColors.splashColor,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey.shade300,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      padding: EdgeInsets.all(24.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(4.r)),
            ),
          ),
          SizedBox(height: 20.h),
          Text('Notification Preference',
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkprimarycolor)),
          SizedBox(height: 20.h),
          _toggle('Push Notifications', 'Receive in-app alerts', _pushEnabled,
                  (v) => setState(() => _pushEnabled = v)),
          Divider(color: Colors.grey.shade100),
          _toggle('Email Notifications', 'Get updates via email', _emailEnabled,
                  (v) => setState(() => _emailEnabled = v)),
          Divider(color: Colors.grey.shade100),
          _toggle('SMS Notifications', 'Get updates via SMS', _smsEnabled,
                  (v) => setState(() => _smsEnabled = v)),
          SizedBox(height: 20.h),
          SizedBox(
            width: double.infinity,
            height: 50.h,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.splashColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.r)),
                elevation: 0,
              ),
              child: Text('Save Preferences',
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
            ),
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
