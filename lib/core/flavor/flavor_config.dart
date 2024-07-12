class FlavorConfig {
  final AppFlavor flavor;
  final String baseUrl;
  FlavorConfig({required this.baseUrl, required this.flavor});
}
enum AppFlavor { dev, prod }
