import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

double getResponsiveFont(BuildContext context, double baseSize) {
  return Responsive.isMobile(context) ? baseSize.sp : baseSize;
}

double getResponsiveHeight(BuildContext context, double baseHeight) {
  return Responsive.isMobile(context) ? baseHeight.h : baseHeight;
}

double getResponsiveWidth(BuildContext context, double baseWidth) {
  return Responsive.isMobile(context) ? baseWidth.w : baseWidth;
}

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width <= 1024;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 1024;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1024) {
          return desktop;
        } else if (constraints.maxWidth >= 600) {
          return tablet ?? mobile;
        } else {
          return mobile;
        }
      },
    );
  }
}
