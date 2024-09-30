import 'dart:convert'; // Import for json encoding
import 'package:get/get.dart';
import 'package:rydleap/core/service/auth_service.dart';
import 'package:rydleap/core/share_pref/share_pref.dart';
import 'package:rydleap/feature/auth/domain/model/login_model.dart';
import 'package:rydleap/feature/auth/login/model/login_model.dart';
import 'package:rydleap/feature/home/presentation/screens/home.dart';
import 'package:rydleap/feature/profile/screen/profile_screen.dart';
import 'package:rydleap/feature/profile_page/presentation/profile_page.dart';

class LoginController extends GetxController {
  var loading = false.obs;
  var loginModel = LoginModel().obs;

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
      
        Get.to(ProfileScreen());
  await SharePref.saveAccessToken(response.data!.accessToken); // Assuming your API returns the token in response.data.token
        await SharePref.saveLoginResponse(response);
        print("Login Successful: ${jsonEncode(response.toJson())}");
        print("Access Token: ${response.toJson()['data']}");
        
      } else {
        print("Login Failed: Response is null or unsuccessful");
      }
    } catch (e) {
      print("Login Error: ${e.toString()}");
    } finally {
      loading(false);
    }
  }



}
