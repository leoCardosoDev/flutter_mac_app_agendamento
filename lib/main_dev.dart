import './core/flavor/flavor_config.dart';
import 'app.dart';

void main() {
  bootstrap(
      FlavorConfig(baseUrl: 'https://dev.flutter.com.br', flavor: AppFlavor.dev));
}
