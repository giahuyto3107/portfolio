import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/theme/app_colors.dart';

class MainWrapper extends StatelessWidget {
  final Widget child;
  const MainWrapper({super.key, required this.child});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundColor
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppConstants.spacingL.w,
              // vertical: AppConstants.spacingXL.h,
            ),
            child: child,
          ),
        ),
      )
    );
  }
}