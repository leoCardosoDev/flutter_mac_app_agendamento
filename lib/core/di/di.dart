import 'package:app_agendamento/core/device/app_device_settings.dart';
import 'package:app_agendamento/core/device/app_external_launcher.dart';
import 'package:app_agendamento/core/device/app_location.dart';
import 'package:app_agendamento/core/device/app_package_info.dart';
import 'package:app_agendamento/core/device/app_preferences.dart';
import 'package:app_agendamento/core/device/app_secure_storage.dart';
import 'package:app_agendamento/core/firebase/crashlytics/app_crashlytics.dart';
import 'package:app_agendamento/core/firebase/messaging/app_messaging.dart';
import 'package:app_agendamento/core/firebase/remote_config/app_remote_config.dart';
import 'package:app_agendamento/core/widgets/alert/cubit/alert_area_cubit.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/auth_datasource.dart';
import '../../features/auth/data/auth_repository.dart';
import '../flavor/flavor_config.dart';
import '../helpers/token_interceptor.dart';

final getIt = GetIt.I;

Future<void> configureDependencies(FlavorConfig config) async {
  getIt.registerSingleton(config);
  getIt.registerSingleton(Dio(BaseOptions(baseUrl: config.baseUrl, headers: {
    'X-Parse-Application-Id': config.appId,
    'X-Parse-REST-API-Key': config.apiKey
  }))
    ..interceptors.addAll([
      TokenInterceptor(),
      if (config.flavor == AppFlavor.dev)
        PrettyDioLogger(requestHeader: true, requestBody: true)
    ]));
  final preferences = await SharedPreferences.getInstance();
  getIt.registerSingleton(preferences);
  getIt.registerFactory(() => AppPreferences(getIt()));

  getIt.registerFactory(() => const FlutterSecureStorage());
  getIt.registerFactory(() => AppSecureStorage(getIt()));

  getIt.registerLazySingleton(() => AlertAreaCubit());

  getIt.registerFactory<AuthDataSource>(() => RemoteAuthDataSource(getIt()));
  getIt.registerLazySingleton(() => AuthRepository(getIt(), getIt()));
  getIt.registerLazySingleton(() => FirebaseCrashlytics.instance);
  getIt.registerSingleton(AppCrashlytics(getIt()));
  getIt.registerLazySingleton(() => FirebaseMessaging.instance);
  getIt.registerSingleton(AppMessaging(getIt()));
  getIt.registerLazySingleton(() => FirebaseRemoteConfig.instance);
  getIt.registerSingleton(AppRemoteConfig(getIt()));
  getIt.registerFactory(() => AppPackageInfo());
  getIt.registerFactory(() => AppLocation());
  getIt.registerFactory(() => AppDeviceSettings());
  getIt.registerFactory(() => AppExternalLauncher());
}
