import 'package:shared_preferences/shared_preferences.dart';

enum AppPreferencesKeys { onboardingDone }

class AppPreferences {
  final SharedPreferences _preferences;
  AppPreferences(this._preferences);

  bool get shouldShowOnboarding =>
      !(_preferences.getBool(AppPreferencesKeys.onboardingDone.name) ?? false);

  void setOnboardingDone() {
    _preferences.setBool(AppPreferencesKeys.onboardingDone.name, true);
  }
}
