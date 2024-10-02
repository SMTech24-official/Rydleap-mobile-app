import 'dart:convert'; // Import for json encoding
import 'package:get/get.dart';
import 'package:rydleap/core/service/auth_service.dart';
import 'package:rydleap/core/share_pref/share_pref.dart';
import 'package:rydleap/feature/auth/domain/model/login_model.dart';
import 'package:rydleap/feature/auth/login/login_screen.dart';
import 'package:rydleap/feature/auth/login/model/login_model.dart';
import 'package:rydleap/feature/home/presentation/screens/home.dart';
import 'package:rydleap/feature/profile/controller/profile_controller.dart';
import 'package:rydleap/feature/profile/screen/check_profile_two.dart';
import 'package:rydleap/feature/profile/screen/profile_screen.dart';
import 'package:rydleap/feature/profile_page/presentation/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var loading = false.obs;
    var rememberMe = false.obs;  // To store the "Remember Me" checkbox state
  var loginModel = LoginModel().obs;
 final ProfileController profileController = Get.put(ProfileController());
  final AuthService _authService = AuthService();

 Future<void> login(String email, String password) async {
    loading(true);

    final loginData = {
      'email': email,
      'password': password,
    };
    print('Login Data (JSON Format): ${jsonEncode(loginData)}');

    try {
      final response = await _authService.login(email, password);

      if (response != null && response.success == true) {
        loginModel.value = response;

        // Save access token
        await SharePref.saveAccessToken(response.data!.accessToken);
        await SharePref.saveLoginResponse(response);
        await SharePref.saveRememberMe(rememberMe.value, email, password);

        // Print stored token
        String? storedToken = await SharePref.getUserAccessToken();
        print("Stored Token: $storedToken");

        // Fetch user data after login and print it
        await profileController.fetchUser(response.data!.accessToken);

        // Navigate to User Profile Page after login
        Get.to(ProfileScreen());
      } else {
        print("Login Failed: Response is null or unsuccessful");
      }
    } catch (e) {
      print("Login Error: ${e.toString()}");
    } finally {
      loading(false);
    }
  }
Future<void> logout() async {
    await SharePref.clearAll(); // If you want to clear all data
    // Optionally, you can leave the email and password intact if that's your goal.
    Get.offAll(() => LoginScreen()); // Navigate back to login screen after logout
}
  var isChecked = false.obs;

  void toggle() {
    isChecked.value = !isChecked.value;
  }

  Future<void> loadSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    isChecked.value = prefs.getBool('remember_me') ?? false;
    if (isChecked.value) {
      // Load saved email and password if needed
    }
  }

  Future<void> saveCredentials(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    if (isChecked.value) {
      prefs.setBool('remember_me', true);
      prefs.setString('saved_email', email);
      prefs.setString('saved_password', password);
    } else {
      prefs.remove('remember_me');
      prefs.remove('saved_email');
      prefs.remove('saved_password');
    }
  }

}
