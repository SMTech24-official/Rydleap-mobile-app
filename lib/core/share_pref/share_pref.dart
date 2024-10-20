import 'dart:convert';
import 'dart:ui';
import 'package:rydleap/feature/auth/login/model/login_model.dart';
import 'package:rydleap/feature/profile/model/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePref {
  static const String _userDataKey = 'user-data';
  static const String _languageKey = 'selected-language';
  static const String _selectedIndexKey = "selectedIndex";
  static const String _rememberMeKey = 'remember-me';
  static const String _emailKey = 'email';
  static const String _passwordKey = 'password';
  static const String _fcmTokenKey = 'fcm-token';

  static bool rememberMe = false;
  static String? savedEmail;
  static String? savedPassword;
  // Method to save FCM token
  static Future<void> saveFcmToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_fcmTokenKey, token);
  }

  // Method to get FCM token
  static Future<String?> getFcmToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_fcmTokenKey);
  }

  static Future<void> saveSelectedIndex(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_selectedIndexKey, index);
  }

  static Future<int> getSelectedIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_selectedIndexKey) ?? 0; // Default to 0 if not found
  }

  // Save selected language
  static Future<void> saveSelectedLanguage(Locale locale) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_languageKey, locale.languageCode);
  }

  // Retrieve selected language
  static Future<Locale> getSelectedLanguage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? languageCode = sharedPreferences.getString(_languageKey);

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

  static Future<void> saveRememberMe(
      bool rememberMe, String email, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(_rememberMeKey, rememberMe);
    if (rememberMe) {
      await sharedPreferences.setString(_emailKey, email);
      await sharedPreferences.setString(_passwordKey, password);
    } else {
      await sharedPreferences.remove(_emailKey);
      await sharedPreferences.remove(_passwordKey);
    }
  }

  static Future<bool> getRememberMeStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(_rememberMeKey) ?? false;
  }

  // Method to clear all saved preferences (clearAll)
  static Future<void> clearAll() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(_userDataKey);
    await sharedPreferences.remove(_rememberMeKey);
    await sharedPreferences.remove(_emailKey);
    await sharedPreferences
        .remove(_passwordKey); // This will remove all stored data
  }
}
