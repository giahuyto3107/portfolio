import 'package:go_router/go_router.dart';
import 'package:portfolio/core/router/app_routes.dart';
import 'package:portfolio/features/home/views/home_screen.dart';
import 'package:portfolio/features/shells/views/main_screen.dart';
import 'package:portfolio/features/skills/views/skills_screen.dart';
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

      GoRoute(
        path: AppRoutes.aboutMePath,
        name: 'spotlight_screen',
        builder: (context, state) => const SkillsScreen(),
      ),

      GoRoute(
        path: AppRoutes.projectsPath,
        name: 'projects_screen',
        builder: (context, state) => const SkillsScreen(),
      ),

      GoRoute(
        path: AppRoutes.skillsPath,
        name: 'skills_screen',
        builder: (context, state) => const SkillsScreen(),
      ),

      // GoRoute(
      //   path: AppRoutes.contactsPath,
      //   name: 'contacts_screen',
      //   builder: (context, state) => const SkillsScreen(),
      // ),
    ]
);