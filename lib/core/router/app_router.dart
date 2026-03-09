import 'package:go_router/go_router.dart';
import 'package:portfolio/core/router/app_routes.dart';
import 'package:portfolio/features/home/views/home_screen.dart';
import 'package:portfolio/features/shells/views/main_screen.dart';
import 'package:portfolio/features/welcome/views/welcome_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'welcome_screen',
        builder: (context, state) => const WelcomeScreen(),
      ),

      GoRoute(
        path: AppRoutes.mainPath,
        name: 'main_screen',
        builder: (context, state) => const MainScreen(),
      ),

      GoRoute(
        path: AppRoutes.homePath,
        name: 'home_screen',
        builder: (context, state) => const HomeScreen(),
      ),
    ]
);