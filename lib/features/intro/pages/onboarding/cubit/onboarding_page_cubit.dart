import 'package:app_agendamento/core/device/app_location.dart';
import 'package:app_agendamento/core/di/di.dart';
import 'package:app_agendamento/core/firebase/messaging/app_messaging.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'onboarding_page_state.dart';

class OnboardingPageCubit extends Cubit<OnboardingPageState> {
  final AppLocation _appLocation;
  final AppMessaging _appMessaging;
  OnboardingPageCubit({AppLocation? appLocation, AppMessaging? appMessaging})
      : _appLocation = appLocation ?? getIt(),
        _appMessaging = appMessaging ?? getIt(),
        super(const OnboardingPageState.initial());

  Future<void> initialize() async {
    final locationStatus = await _appLocation.checkStatus();
    final messagingStatus = await _appMessaging.checkStatus();
    print("LOCATION = $locationStatus");
    print("MENSSAGE = $messagingStatus");
    emit(OnboardingPageState(
      showNotificationPage: [
        AppMessagingStatus.notDetermined,
        AppMessagingStatus.denied
      ].contains(messagingStatus),
      showLocationPage: [
        AppLocationStatus.denied,
        AppLocationStatus.deniedForever
      ].contains(locationStatus),
    ));
  }
}
