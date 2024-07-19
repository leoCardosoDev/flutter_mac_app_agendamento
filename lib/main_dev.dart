import './core/flavor/flavor_config.dart';
import 'app.dart';

void main() {
  bootstrap(
      FlavorConfig(
        appId: 'rC6gTn3o6JFMjSAnmKWTm7YFnKRWeOpEEHHcRoER',
        apiKey: 'M7zGDkCPUn1fAbbBMtgZIhxmeB1E1EIZNZV4sedd',
        baseUrl: 'https://parseapi.back4app.com/functions',
        flavor: AppFlavor.dev)
    );
}
