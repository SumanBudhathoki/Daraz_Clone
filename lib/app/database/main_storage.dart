import 'package:get_storage/get_storage.dart';

class MainStorage {
  static GetStorage? storage = GetStorage('App');

  static const String keyOnboarding = 'on_boarding';
  // static const String keyEmail = 'email';
  // static const String keyPassword = 'password';
  // static const String keyRememberme = 'rememberme';
  // static const String keyAccessToken = 'access_token';
  // static const String keyLanguage = 'language';
  // static const String keyCountryId = 'country_id';

////////////////////functions to write data/////////////////////////////
//  Saves onboarding status
  static void saveOnboarding(dynamic value) {
    MainStorage.storage?.write(keyOnboarding, value);
  }

  // static void saveEmail(dynamic value) {
  //   MainUserStorage.storage?.write(keyEmail, value);
  // }

  // static void savePassword(dynamic value) {
  //   MainUserStorage.storage?.write(keyPassword, value);
  // }

  // static void saveRememberme(dynamic value) {
  //   MainUserStorage.storage?.write(keyRememberme, value);
  // }

  // static void saveAccessToken(dynamic value) {
  //   MainUserStorage.storage?.write(keyAccessToken, value);
  // }

  // static void saveLanguage(dynamic value) {
  //   MainUserStorage.storage?.write(keyLanguage, value);
  // }

  // static void saveCountryId(dynamic value) {
  //   MainUserStorage.storage?.write(keyCountryId, value);
  // }

  ////////////////////Function to read data/////////////////////////////
  //Function to read status of onboarding
  static dynamic get readOnboarding {
    return storage?.read(keyOnboarding);
  }

  // static String? get readEmail {
  //   return storage?.read(keyEmail);
  // }

  // static String? get readPassword {
  //   return storage?.read(keyPassword);
  // }

  // static bool? get readReemberme {
  //   return storage?.read(keyRememberme);
  // }

  // static String? get readAccessToken {
  //   return storage?.read(keyAccessToken);
  // }

  // static String? get readLanguage {
  //   return storage?.read(keyLanguage);
  // }

  // static String? get readCountryId {
  //   return storage?.read(keyCountryId);
  // }

  ////////////////////Function to remove data/////////////////////////////
  static void removeStorage() {
    MainStorage.storage?.remove(keyOnboarding);
    // MainUserStorage.storage?.remove(keyEmail);
    // MainUserStorage.storage?.remove(keyPassword);
    // MainUserStorage.storage?.remove(keyRememberme);
    // MainUserStorage.storage?.remove(keyAccessToken);
    // MainUserStorage.storage?.remove(keyLanguage);
    // MainUserStorage.storage?.remove(keyCountryId);
  }
}
