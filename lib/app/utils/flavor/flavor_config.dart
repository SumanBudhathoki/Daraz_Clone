enum Flavor { development, production }

class FlavorConfig {
  static Flavor appFlavor = Flavor.development;

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.production:
        return 'https://fakestoreapi.com/products/';

      case Flavor.development:
        return 'https://fakestoreapi.com/products/';

      default:
        return 'https://fakestoreapi.com';
    }
  }
}
