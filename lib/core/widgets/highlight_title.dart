import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/utils/responsive.dart';

class HighLightTitle extends StatelessWidget {
  final String primaryText;
  final String secondaryText;

  const HighLightTitle({
    super.key,
    required this.primaryText,
    this.secondaryText = "",
  });

  @override
  Widget build (BuildContext context) {
    return Column(
      children: [
        Text(
          primaryText,
          style: TextStyle(
            fontSize: Responsive.isDesktop(context)
              ? getResponsiveFont(context, AppConstants.fontXXXL)
              : getResponsiveFont(context, AppConstants.fontXXL),
            fontWeight: .w600,
            color: AppColors.textOnDark
          ),
        ),
        SizedBox(height: AppConstants.spacingS.h,),
        Container(
          height: 5.h,
          width: 150.w,
          decoration: BoxDecoration(
            gradient: AppColors.horizontalGradientButton,
            borderRadius: BorderRadius.circular(AppConstants.radiusCircular.r)
          ),
        ),
        SizedBox(height: AppConstants.spacingM.h,),
        secondaryText == "" ? Container() : Text(
          secondaryText,
          style: TextStyle(
            fontSize: Responsive.isDesktop(context)
                ? getResponsiveFont(context, AppConstants.fontL)
                : getResponsiveFont(context, AppConstants.fontM),
            fontWeight: .w400,
            color: AppColors.secondaryText
          ),
        ),
        secondaryText == "" ? Container() : SizedBox(height: AppConstants.spacingXL.h,),
      ],
    );
  }
}