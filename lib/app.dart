import 'package:app_agendamento/core/theme/app_theme.dart';
import 'package:app_agendamento/core/utils/no_glow_behavior.dart';
import 'package:app_agendamento/core/widgets/alert/alert_area.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/di.dart';
import 'core/flavor/flavor_config.dart';
import 'core/routes/app_routes.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> bootstrap(FlavorConfig config) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await configureDependencies(config);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(DevicePreview(
    builder: (_) => const App(),
    enabled: config.flavor == AppFlavor.prod, // TODO: mudar para: dev
  ));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme();
    return RepositoryProvider.value(
      value: theme,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        locale: DevicePreview.locale(context),
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.white,
          textButtonTheme: const TextButtonThemeData(),
          buttonTheme: const ButtonThemeData(
            buttonColor: Colors.transparent,
          ),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: theme.primary,
            selectionHandleColor: theme.primary,
            selectionColor: theme.primary.withOpacity(0.3),
          ),
        ),
        builder: (context, child) {
          final newChild = ScrollConfiguration(
            behavior: NoGlowBehavior(),
            child: Stack(
              children: [
                if (child != null) child,
                const AlertArea(),
              ],
            ),
          );
          return DevicePreview.appBuilder(context, newChild);
        },
      ),
    );
  }
}
