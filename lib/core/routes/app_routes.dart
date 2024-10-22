import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => Scaffold(
        body: Center(
          child: TextButton(
                  onPressed: () => throw Exception(),
                  child: const Text("Throw Test Exception"),
                ),
        ),
      ),
    ),
    GoRoute(
      path: '/auth',
      builder: (context, state) => Container(),
    ),
  ],
);
