import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rydleap/core/service/auth_service.dart';
import 'package:rydleap/feature/auth/registration/model/registration_response.dart';

class RegistrationController extends GetxController {
  final AuthService authService = AuthService();
  var isLoading = false.obs;

  // Nullable RegistrationResponse
  Rxn<RegistrationResponse> registrationResponse = Rxn<RegistrationResponse>();

  // Method for registering a user
  Future<void> registerUser(String fullName, String email, String phoneNumber,
      String password, String role) async {
    isLoading(true);
    try {
      final request = RegistrationRequest(
        fullName: fullName,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
        role: role,
      );

      // Call the AuthService to register the user
      final response = await authService.registerUser(request);

      // Check if the response is not null and parse it
      if (response != null) {
        registrationResponse.value =
            response; // Assigning the RegistrationResponse directly

        if (registrationResponse.value!.success) {
          Get.snackbar(
            "Success",
            registrationResponse.value!.message,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          // Navigation or additional logic after successful registration
        } else {
          print("Error: ${registrationResponse.value!.message}");
          Get.snackbar(
            "Error",
            registrationResponse.value!.message,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      }
    } catch (e) {
      print('Error during registration: ${e.toString()}');
      Get.snackbar(
        "Error",
        "Registration failed. Please try again.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }

  // Method for registering a driver
  Future<void> registerDriver(String fullName, String email, String phoneNumber,
      String password, String role) async {
    isLoading(true);
    try {
      final request = RegistrationRequest(
        fullName: fullName,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
        role: role,
      );

      // Call the AuthService to register the driver
      final response = await authService.registerDriver(request);

      // Check if the response is not null and parse it
      if (response != null) {
        registrationResponse.value =
            response; // Assigning the RegistrationResponse directly

        if (registrationResponse.value!.success) {
          Get.snackbar(
            "Success",
            registrationResponse.value!.message,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          // Navigation or additional logic after successful driver registration
        } else {
          print("Error: ${registrationResponse.value!.message}");
          Get.snackbar(
            "Error",
            registrationResponse.value!.message,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      }
    } catch (e) {
      print('Error during driver registration: ${e.toString()}');
      Get.snackbar(
        "Error",
        "Driver registration failed. Please try again.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }
}
