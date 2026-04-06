import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/router/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  runApp(
    ProviderScope(
      child: kReleaseMode
        ? const MyApp()
        : DevicePreview(
          enabled: true,
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
    return ScreenUtilInit(
      designSize: const Size(360, 690),
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
}
