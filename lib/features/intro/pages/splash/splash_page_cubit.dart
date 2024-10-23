import 'package:app_agendamento/core/device/app_package_info.dart';
import 'package:app_agendamento/core/device/app_preferences.dart';
import 'package:app_agendamento/core/di/di.dart';
import 'package:app_agendamento/core/firebase/remote_config/app_remote_config.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_page_state.dart';

class SplashPageCubit extends Cubit<SplashPageState> {
  SplashPageCubit(
      {AppRemoteConfig? appRemoteConfig,
      AppPackageInfo? appPackageInfo,
      AppPreferences? appPreferences})
      : _appRemoteConfig = appRemoteConfig ?? getIt(),
        _appPackageInfo = appPackageInfo ?? getIt(),
        _appPreferences = appPreferences ?? getIt(),
        super(const SplashPageState());

  final AppRemoteConfig _appRemoteConfig;
  final AppPackageInfo _appPackageInfo;
  final AppPreferences _appPreferences;

  Future<void> initialize() async {
    final results = await Future.wait([
      _initRemoteConfig(),
      Future.delayed(const Duration(seconds: 2)),
    ]);

    if (results[0] == AppStatus.maintenance) {
      return;
    } else if (results[0] == AppStatus.forceUpdate) {
      return;
    }
    final shouldShowOnboarding = _appPreferences.shouldShowOnboarding;
    if (shouldShowOnboarding) {
      emit(state.copyWith(status: SplashPageStatus.goToOnboarding));
    }
  }

  Future<AppStatus> _initRemoteConfig() async {
    await _appRemoteConfig.initialize();
    final isMaintenance = _appRemoteConfig.isMaintenance;
    if (isMaintenance) return AppStatus.maintenance;
    final appMinVersion = _appRemoteConfig.appMinVersion;
    final appVersion = await _appPackageInfo.getBuildNumber();
    if (appVersion < appMinVersion) {
      return AppStatus.forceUpdate;
    } else {
      return AppStatus.available;
    }
  }
}

enum AppStatus { available, maintenance, forceUpdate }
