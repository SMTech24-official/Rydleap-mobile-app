import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rydleap/core/service/auth_service.dart';
import 'package:rydleap/feature/auth/presentaion/screens/registration/model/registration_response.dart';

class RegistrationController extends GetxController {
  AuthService authService = AuthService();
  var isLoading = false.obs;
  var registrationResponse = RegistrationResponse(
    success: false,
    message: '',
    data: RegistrationData(
      id: '',
      name: '',
      email: '',
      userName: null,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ).obs;

  Future<void> registerUser(
      String name, String email, String phoneNumber, String password) async {
    isLoading(true);
    try {
      final request = RegistrationRequest(
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
      );

      final response = await authService.registerUser(request);

      if (response != null && response is Map<String, dynamic>) {
        registrationResponse.value =
            RegistrationResponse.fromJson(response as Map<String, dynamic>);
        if (registrationResponse.value.success) {
          Get.snackbar("Success", registrationResponse.value.message,
              backgroundColor: Colors.green, colorText: Colors.white);
          // Navigate to another screen if needed
        } else {
          print("Error ${registrationResponse.value.message}");
          Get.snackbar("Error", registrationResponse.value.message,
              backgroundColor: Colors.red, colorText: Colors.white);
        }
      }
    } catch (e) {
      print('Error during registration: ${e.toString()}');
      Get.snackbar("Error", "Registration failed. Please try again.",
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading(false);
    }
  }

  Future<void> registerDriver(
      String name, String email, String phoneNumber, String password) async {
    isLoading(true);
    try {
      final request = RegistrationRequest(
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
      );

      final response = await authService.registerDriver(request);

      if (response != null && response is Map<String, dynamic>) {
        registrationResponse.value =
            RegistrationResponse.fromJson(response as Map<String, dynamic>);
        if (registrationResponse.value.success) {
          Get.snackbar("Success", registrationResponse.value.message,
              backgroundColor: Colors.green, colorText: Colors.white);
          // Navigate to another screen if needed
        } else {
          print("Error ${registrationResponse.value.message}");
          Get.snackbar("Error", registrationResponse.value.message,
              backgroundColor: Colors.red, colorText: Colors.white);
        }
      }
    } catch (e) {
      print('Error during registration: ${e.toString()}');
      Get.snackbar("Error", "Registration failed. Please try again.",
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading(false);
    }
  }



}
