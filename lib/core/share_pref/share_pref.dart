import 'dart:convert';
import 'dart:ui';
import 'package:rydleap/feature/auth/domain/model/login_model.dart';
import 'package:rydleap/feature/auth/login/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePref {
  static const String _accessTokenKey = 'access-token';
  static const String _userDataKey = 'user-data';
  static const String _languageKey = 'selected-language';
  static const String _selectedIndexKey = "selectedIndex";
  static const String _rememberMeKey = 'remember-me';
  static const String _emailKey = 'email';
  static const String _passwordKey = 'password';

  static String accessToken = '';
  static bool rememberMe = false;
  static String? savedEmail;
  static String? savedPassword;

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
    accessToken = token; // Store it in the static variable for quick access
  }

  // Retrieve access token
  static Future<String?> getUserAccessToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_accessTokenKey);
  }

  // Check if the user is authenticated
  static Future<bool> checkAuthState() async {
    String? token = await getUserAccessToken();
    return token != null; // Return true if token exists
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

  // Save login response (user data)
  static Future<void> saveLoginResponse(LoginModel loginModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String userDataJson =
        jsonEncode(loginModel.toJson()); // Convert to JSON string
    await sharedPreferences.setString(_userDataKey, userDataJson);
  }

  // Retrieve login response (user data)
  static Future<LoginModel?> getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userDataJson = sharedPreferences.getString(_userDataKey);

    if (userDataJson != null) {
      Map<String, dynamic> userMap = jsonDecode(userDataJson);
      return LoginModel.fromJson(userMap); // Convert back to LoginModel
    }
    return null;
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

  static Future<String?> getSavedEmail() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_emailKey);
  }

  static Future<String?> getSavedPassword() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_passwordKey);
  }

  // Method to clear all saved preferences (clearAll)
  static Future<void> clearAll() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(_accessTokenKey);
    await sharedPreferences.remove(_userDataKey);
    await sharedPreferences.remove(_rememberMeKey);
    await sharedPreferences.remove(_emailKey);
    await sharedPreferences
        .remove(_passwordKey); // This will remove all stored data
    accessToken = ''; // Reset the static variable for accessToken
  }
}
