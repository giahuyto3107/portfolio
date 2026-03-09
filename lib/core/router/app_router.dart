import 'package:go_router/go_router.dart';
import 'package:portfolio/features/welcome/views/welcome_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
    routes: [
        GoRoute(
            path: '/',
            name: 'welcome_screen',
            builder: (context, state) => const WelcomeScreen(),
        ),
    ]
);