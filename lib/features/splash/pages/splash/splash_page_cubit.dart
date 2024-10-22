import 'package:app_agendamento/core/device/app_package_info.dart';
import 'package:app_agendamento/core/di/di.dart';
import 'package:app_agendamento/core/firebase/remote_config/app_remote_config.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_page_state.dart';

class SplashPageCubit extends Cubit<SplashPageState> {
  SplashPageCubit(
      {AppRemoteConfig? appRemoteConfig, AppPackageInfo? appPackageInfo})
      : _appRemoteConfig = appRemoteConfig ?? getIt(),
        _appPackageInfo = appPackageInfo ?? getIt(),
        super(SplashPageInitial());

  final AppRemoteConfig _appRemoteConfig;
  final AppPackageInfo _appPackageInfo;

  Future<void> initialize() async {
    await Future.wait([
      _initRemoteConfig(),
    ]);
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
