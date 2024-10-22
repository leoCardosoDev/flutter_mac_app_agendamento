import 'package:app_agendamento/features/splash/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/auth',
      builder: (context, state) => Container(),
    ),
  ],
);
