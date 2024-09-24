import 'dart:convert';
import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';

class SharePref {
  static const String _accessTokenKey = 'access-token';
  static const String _userDataKey = 'user-data';
  static const String _languageKey = 'selected-language';

  static String accessToken = '';
  // static UserModel? userData;
static const String _selectedIndexKey = "selectedIndex";

  static Future<void> saveSelectedIndex(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_selectedIndexKey, index);
  }

  static Future<int> getSelectedIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_selectedIndexKey) ?? 0; // Default to 0 if not found
  }
  // Save access token
  static Future<void> saveAccessToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_accessTokenKey, token);
    accessToken = token;
  }

  // Retrieve access token
  static Future<String?> getUserAccessToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_accessTokenKey);
  }

  // Save user data
  // static Future<void> saveUser(UserModel user) async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   await sharedPreferences.setString(_userDataKey, jsonEncode(user.toJson()));
  //   userData = user;
  // }

  // Retrieve user data
  // static Future<UserModel?> getUserData() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   String? data = sharedPreferences.getString(_userDataKey);
  //   if (data == null) return null;

  //   UserModel userModel = UserModel.fromJson(jsonDecode(data));
  //   return userModel;
  // }

  // Clear all stored data
  // static Future<void> clearAllData() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   await sharedPreferences.clear();
  //   accessToken = '';
  //   userData = null;
  // }

  // Check if the user is authenticated
  // static Future<bool> checkAuthState() async {
  //   String? token = await getUserAccessToken();
  //   if (token == null) {
  //     return false;
  //   } else {
  //     accessToken = token;
  //     userData = await getUserData();
  //     return true;
  //   }
  // }

  // Save selected language
  static Future<void> saveSelectedLanguage(Locale locale) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_languageKey, locale.languageCode);
  }

  // Retrieve selected language
  static Future<Locale> getSelectedLanguage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? languageCode = sharedPreferences.getString(_languageKey);

    // Return the corresponding Locale object based on the saved language code
    switch (languageCode) {
      case 'bn':
        return const Locale('bn', 'BN');
      case 'es':
        return const Locale('es', 'ES');
      case 'pt':
        return const Locale('pt', 'PT');
      case 'fr':
        return const Locale('fr', 'FR');
      default:
        return const Locale('en', 'US'); // Default to English
    }
  }
}
