import 'dart:isolate';
import 'dart:ui';

import 'package:app_agendamento/core/helpers/result.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'core/di/di.dart';
import 'core/flavor/flavor_config.dart';
import 'core/routes/app_routes.dart';
import 'features/auth/data/auth_repository.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> bootstrap(FlavorConfig config) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = (error) {
    debugPrint('ESSE FOI O ERRO => $error');
    FirebaseCrashlytics.instance.recordFlutterError(error);
  };
  FirebaseCrashlytics.instance.crash();
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  Isolate.current.addErrorListener(RawReceivePort((pair) async {
    final List<dynamic> errorAndStacktrace = pair;
    await FirebaseCrashlytics.instance.recordError(
      errorAndStacktrace.first,
      errorAndStacktrace.last,
      fatal: true,
    );
  }).sendPort);
  await configureDependencies(config);
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
    final AuthRepository authRepository = getIt();
    final result = await authRepository.login(
        email: 'leocardoso@gmail.com', password: '12345678');
    switch (result) {
      case Success(object: final user):
        debugPrint('Successo: ${user.id}');
      case Failure(error: final error):
        debugPrint('App $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
