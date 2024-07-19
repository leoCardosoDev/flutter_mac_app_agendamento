import './core/flavor/flavor_config.dart';
import 'app.dart';

void main() {
    bootstrap(
      FlavorConfig(
        appId: '',
        apiKey: '',
        baseUrl: '',
        flavor: AppFlavor.prod)
    );
}
