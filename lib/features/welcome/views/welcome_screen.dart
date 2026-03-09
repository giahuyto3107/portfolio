import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/app_strings.dart';
import 'package:portfolio/core/theme/app_colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.spacingXXXL.w,
          ),
          child: Column(
            children: [
              SizedBox(height: AppConstants.spacingXXXL.h,),
              Expanded(child: const _ImageContainer()),
              SizedBox(height: AppConstants.spacingXXXL.h,),
              const _PrimaryTitle(),
              SizedBox(height: AppConstants.spacingL.h,),
              const _SecondaryTitle(),
              SizedBox(height: AppConstants.spacingXXL.h,),
              const _ViewMyWorkButton(),
              SizedBox(height: AppConstants.spacingXXL.h,),
            ],
          ),
        )
      )
    );
  }
}

class _ImageContainer extends StatelessWidget {
  const _ImageContainer();

  @override
  Widget build (BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
    );
  }
}

class _PrimaryTitle extends StatelessWidget {
  const _PrimaryTitle();

  @override
  Widget build (BuildContext context) {
    return Text(
      AppStrings.primaryAppTitle,
      style: TextStyle(
        fontSize: AppConstants.fontL.sp,
        fontWeight: .w600,
        color: AppColors.textOnDark,
      ),
      textAlign: .center,
    );
  }
}

class _SecondaryTitle extends StatelessWidget {
  const _SecondaryTitle();

  @override
  Widget build (BuildContext context) {
    return Text(
      AppStrings.secondaryAppTitle,
      style: TextStyle(
        fontSize: AppConstants.fontXS.sp,
        fontWeight: .w400,
        color: AppColors.secondaryText,
      ),
      maxLines: 3,
      textAlign: .center,
    );
  }
}

class _ViewMyWorkButton extends StatelessWidget {
  const _ViewMyWorkButton();

  @override
  Widget build (BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.horizontalGradientButton,
        borderRadius: BorderRadius.circular(AppConstants.radiusCircular.r)
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.spacingXL.w,
        vertical: AppConstants.spacingM.h,
      ),
      child: Row(
        mainAxisAlignment: .center,
        mainAxisSize: .min,
        children: [
          Icon(
            Icons.arrow_forward,
            color: AppColors.textOnDark,
            size: AppConstants.fontM.sp,
            weight: AppConstants.borderMedium,
          ),
          SizedBox(width: AppConstants.spacingS.w,),
          Text(
            AppStrings.viewMyWork,
            style: TextStyle(
              fontSize: AppConstants.fontS.sp,
              fontWeight: .w500,
              color: AppColors.textOnDark
            ),
          )
        ],
      ),
    );
  }
}