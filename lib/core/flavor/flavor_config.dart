class FlavorConfig {
  final AppFlavor flavor;
  final String baseUrl;
  final String appId;
  final String apiKey;
  FlavorConfig({required this.appId, required this.apiKey, required this.baseUrl, required this.flavor});
}

enum AppFlavor { dev, prod }
