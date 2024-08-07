import 'dart:isolate';
import 'dart:ui';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

class AppCrashlytics {
  final FirebaseCrashlytics _crashlytics;
  AppCrashlytics(this._crashlytics) {
    _configureCrashlytics();
  }

  void _configureCrashlytics() {
    FlutterError.onError = (error) {
      debugPrint('ESSE FOI O ERRO => $error');
      _crashlytics.recordFlutterError(error);
    };

    _crashlytics.crash();
    PlatformDispatcher.instance.onError = (error, stack) {
      _crashlytics.recordError(error, stack, fatal: true);
      return true;
    };

    Isolate.current.addErrorListener(RawReceivePort((pair) async {
      final List<dynamic> errorAndStacktrace = pair;
      await _crashlytics.recordError(
        errorAndStacktrace.first,
        errorAndStacktrace.last,
        fatal: true,
      );
    }).sendPort);
  }
}
