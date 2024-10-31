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
      builder: (context, state) => Container(color: Colors.redAccent),
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
}
