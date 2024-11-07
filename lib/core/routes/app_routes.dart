import 'package:app_agendamento/features/auth/pages/auth/auth_page.dart';
import 'package:app_agendamento/features/auth/pages/login/login_page.dart';
import 'package:app_agendamento/features/auth/pages/signup/signup_page.dart';
import 'package:app_agendamento/features/intro/pages/force_update/force_update_page.dart';
import 'package:app_agendamento/features/intro/pages/maintenance/maintenance_page.dart';
import 'package:app_agendamento/features/intro/pages/not_found/not_found_page.dart';
import 'package:app_agendamento/features/intro/pages/onboarding/onboarding_page.dart';
import 'package:app_agendamento/features/intro/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  redirect: (context, state) {
    return null;
  },
  errorBuilder: (context, state) => const NotFoundPage(),
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: AppRoutes.onboarding,
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: AppRoutes.auth,
      builder: (context, state) => const AuthPage(),
      routes: [
        GoRoute(
          path: AppRoutes.signUp.path,
          builder: (context, state) => const SignupPage(),
        ),
        GoRoute(
          path: AppRoutes.login.path,
          builder: (context, state) => const LoginPage(),
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => Container(color: Colors.greenAccent),
    ),
    GoRoute(
      path: AppRoutes.maintenance,
      builder: (context, state) => const MaintenancePage(),
    ),
    GoRoute(
      path: AppRoutes.forceUpdate,
      builder: (context, state) => const ForceUpdatePage(),
    ),
  ],
);

class AppRoutes {
  static String get splash => '/';
  static String get home => '/home';
  static String get onboarding => '/onboarding';
  static String get auth => '/auth';
  static String get maintenance => '/maintenance';
  static String get forceUpdate => '/force-update';
  static AppRoute get signUp =>
      const AppRoute(fullPath: '/auth/signup', path: 'signup');
  static AppRoute get login =>
      const AppRoute(fullPath: '/auth/login', path: 'login');
}

class AppRoute {
  final String fullPath;
  final String path;
  const AppRoute({required this.fullPath, required this.path});
}
