import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/app_strings.dart';
import 'package:portfolio/core/router/app_routes.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/utils/responsive.dart';
import 'package:portfolio/core/widgets/main_wrapper.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build (BuildContext context) {
    return MainWrapper(
      child: Column(
        children: [
          SizedBox(height: AppConstants.spacingXXXL.h,),
          const _FloatingImage(),
          SizedBox(height: AppConstants.spacingXL.h,),
          const _PrimaryTitle(),
          SizedBox(height: AppConstants.spacingL.h,),
          const _SecondaryTitle(),
          SizedBox(height: AppConstants.spacingXXL.h,),
          const _ViewMyWorkButton(),
        ],
      ),
    );
  }
}

class _FloatingImage extends StatefulWidget {
  const _FloatingImage();

  @override
  State<_FloatingImage> createState() => _FloatingImageState();
}

class _FloatingImageState extends State<_FloatingImage> with TickerProviderStateMixin{
  late final AnimationController _zoomController;
  late final Animation<double> _zoomAnimation;

  late final AnimationController _spinController;

  final int size = 300;
  late final double radius;

  final List<IconData> icons = [
    FontAwesomeIcons.database, Icons.phone_android, Icons.laptop,
    Icons.code, FontAwesomeIcons.gitAlt, Icons.dns,
    Icons.local_fire_department, FontAwesomeIcons.flutter, FontAwesomeIcons.android,
    FontAwesomeIcons.python,
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _zoomController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _zoomAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: _zoomController,
        curve: Curves.easeInOut,
      ),
    );

    _spinController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();


    radius = size * 0.3;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _zoomController.dispose();
    _spinController.dispose();
    super.dispose();
  }

  @override
  Widget build (BuildContext context) {

    return SizedBox(
      width: size.w,
      height: size.w,
      child: Stack(
        alignment: .center,
        children: [
          ScaleTransition(
            scale: _zoomAnimation,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppConstants.radiusCircular.r),
              child: Image.asset(
                'assets/portfolio_avt.png',
                fit: BoxFit.cover,
                height: size.w * 0.3,
                width: size.w * 0.3,
              ),
            )
          ),

          AnimatedBuilder(
            animation: _spinController,
            builder: (context, child) {
              return Stack(
                children: List.generate(icons.length, (index) {
                  // Calculate the angle for this specific icon
                  double baseAngle = (index * 2 * 3.14159) / icons.length;
                  double currentAngle = baseAngle + (_spinController.value * 2 * math.pi);
                  return Align(
                    alignment: .center,
                    child: Transform.translate(
                      offset: Offset(
                        radius * math.cos(currentAngle), // X movement
                        radius * math.sin(currentAngle), // Y movement
                      ),
                      child: _TechIcon(
                        icon: icons[index],
                      ),
                    ),
                  );
                })
              );
            },
          )
        ]
      ),
    );
  }
}

class _TechIcon extends StatefulWidget {
  final IconData icon;

  const _TechIcon({
    required this.icon,
  });

  @override
  State<_TechIcon> createState() => _TechIconState();
}

class _TechIconState extends State<_TechIcon> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build (BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppConstants.spacingS.h,
          vertical: AppConstants.spacingS.h,
        ),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(AppConstants.radiusL.r),
          boxShadow: [BoxShadow(color: Colors.blue.withAlpha(127), blurRadius: 10)],
        ),
        child: Icon(
          widget.icon,
          color: Colors.white,
          size: getResponsiveFont(context, AppConstants.fontL),
        ),
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
        fontSize: getResponsiveFont(context, AppConstants.fontL),
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
        fontSize: getResponsiveFont(context, AppConstants.fontXS),
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
    return GestureDetector(
      onTap: () => context.go(AppRoutes.mainPath),
      child: Container(
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
              size: getResponsiveFont(context, AppConstants.fontM),
              weight: AppConstants.borderMedium,
            ),
            SizedBox(width: AppConstants.spacingS.w,),
            Text(
              AppStrings.viewMyWork,
              style: TextStyle(
                fontSize: getResponsiveFont(context, AppConstants.fontS),
                fontWeight: .w500,
                color: AppColors.textOnDark
              ),
            )
          ],
        ),
      ),
    );
  }
}