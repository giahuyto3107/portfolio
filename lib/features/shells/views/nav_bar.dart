import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/utils/responsive.dart';

class NavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const NavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(getResponsiveFont(context, 50)), // Matches your design
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), // The "Frosted" effect
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff07203e).withAlpha(178),
            borderRadius: BorderRadius.circular(getResponsiveFont(context, 50)),
            border: Border.all(
              color: const Color(0xffE6E6E6).withAlpha(127), // Lighter border
              width: 1.w
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppConstants.spacingXS.w,
              vertical: AppConstants.spacingXS.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: .min,
              crossAxisAlignment: .center,
              children: [
                _NavBarItem(
                  icon: Icons.home,
                  index: 0,
                  isSelected: currentIndex == 0,
                  onTap: onTap,
                ),
                _NavBarItem(
                  icon: Icons.person,
                  index: 1,
                  isSelected: currentIndex == 1,
                  onTap: onTap,
                ),
                _NavBarItem(
                  icon: FontAwesomeIcons.briefcase,
                  index: 2,
                  isSelected: currentIndex == 2,
                  onTap: onTap,
                ),
                _NavBarItem(
                  icon: Icons.code,
                  index: 3,
                  isSelected: currentIndex == 3,
                  onTap: onTap,
                ),
                _NavBarItem(
                  icon: FontAwesomeIcons.addressCard,
                  index: 4,
                  isSelected: currentIndex == 4,
                  onTap: onTap,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final int index;
  final bool isSelected;
  final Function(int) onTap;

  const _NavBarItem({
    required this.icon,
    required this.index,
    required this.isSelected,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 55.w,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Color(0xff4ab3f6) : Colors.transparent,
            borderRadius: BorderRadius.circular(AppConstants.radiusCircular.r),
          ),
          padding: EdgeInsets.symmetric(
            vertical: AppConstants.spacingXS.h,
          ),
          child: Column(
            children: [
              Icon(
                icon,
                size: getResponsiveFont(context, AppConstants.fontXL),
                color: isSelected ? AppColors.textOnDark : AppColors.disable,
              ),
            ],
          ),
        ),
      ),
    );
  }
}