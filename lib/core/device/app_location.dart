import 'package:geolocator/geolocator.dart';

enum AppLocationStatus { disabled, denied, deniedForever, allowed }

class AppLocation {
  Future<AppLocationStatus> checkStatus() async {
    final isEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isEnabled) return AppLocationStatus.disabled;
    final permission = await Geolocator.checkPermission();
    switch (permission) {
      case LocationPermission.always:
      case LocationPermission.whileInUse:
        return AppLocationStatus.allowed;
      case LocationPermission.denied:
        return AppLocationStatus.denied;
      case LocationPermission.deniedForever ||
            LocationPermission.unableToDetermine:
        return AppLocationStatus.deniedForever;
    }
  }
}
