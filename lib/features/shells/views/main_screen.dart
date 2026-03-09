import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/widgets/main_wrapper.dart';
import 'package:portfolio/features/home/views/home_screen.dart';
import 'package:portfolio/features/shells/providers/main_navigation_controller.dart';
import 'package:portfolio/features/shells/views/nav_bar.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build (BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(mainNavigationControllerProvider);

    List<Widget> _screens = [
      const HomeScreen(),
    ];

    return MainWrapper(
      child: Stack(
        children: [
          IndexedStack(
            index: currentIndex,
            children: _screens,
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: AppConstants.spacingS.h,
                ),
                child: IntrinsicHeight(
                  child: NavBar(
                    onTap: ref.read(mainNavigationControllerProvider.notifier).setIndex,
                    currentIndex: currentIndex,
                  ),
                ),
              )
            ),
          )
        ],
      )
    );
  }
}