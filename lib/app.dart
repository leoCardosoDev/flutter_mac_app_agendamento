import 'package:flutter/material.dart';

import 'core/flavor/flavor_config.dart';
import 'core/helpers/result.dart';
import 'core/routes/app_routes.dart';
import 'features/auth/data/auth_repository.dart';

void bootstrap(FlavorConfig config) {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    final AuthRepository authRepository = AuthRepository();
    final result = await authRepository.login(email: 'leosilva@gmail.com', password: '12345678');
    switch(result) {
      case Success(object: final user):
        debugPrint('Success ${user.id}');
      case Failure(error: final error):
        debugPrint(error.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}