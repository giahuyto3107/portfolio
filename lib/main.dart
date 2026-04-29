import 'dart:ui' as ui;
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/router/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ui.channelBuffers.resize('flutter/lifecycle', 100);

  runApp(
    ProviderScope(
      child: kReleaseMode
        ? const MyApp()
        : DevicePreview(
          enabled: !kReleaseMode,
          builder: (context) => const MyApp(),
        ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final screenWidth = MediaQuery.sizeOf(context).width;
        final screenHeight = MediaQuery.sizeOf(context).height;

        // Use a fixed design size if screen width is not yet available or small.
        // Otherwise, adapt to the current screen size for desktop.
        final designSize = (screenWidth >= 600)
            ? Size(screenWidth, screenHeight)
            : const Size(360, 690);

        return ScreenUtilInit(
          designSize: designSize,
          minTextAdapt: true,
          splitScreenMode: true,
          useInheritedMediaQuery: true,
          builder: (context, child) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: appRouter,
              locale: kReleaseMode ? null : DevicePreview.locale(context),
              builder: kReleaseMode ? null : DevicePreview.appBuilder,
              themeMode: ThemeMode.light,
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                brightness: Brightness.dark,
                useMaterial3: false,
              ),
            );
          },
        );
      }
    );
  }
}
