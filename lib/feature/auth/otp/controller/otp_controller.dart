// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:rydleap/core/service/auth_service.dart';
// import 'package:rydleap/feature/auth/login/controller/forgot_controller.dart';
// import 'package:rydleap/feature/auth/login/login_screen.dart';
// import 'package:rydleap/feature/auth/otp/model/otp_response.dart';

// import '../../../../core/api_url.dart';
// import 'package:http/http.dart' as http;

// import '../../presentaion/screens/create_password.dart';
// import '../../create_new_password/create_new_password.dart';

// class OtpController extends GetxController {
//   ForgotController forgotController = Get.find();

//   var isLoading = false.obs;
//   var otpCode = ''.obs;
//   var otpResponse = OtpResponse(
//     success: false,
//     message: '',
//     data: OtpData(
//       body: '',
//       from: '',
//       to: '',
//       status: '',
//       sid: '',
//       dateCreated: DateTime.now(),
//     ),
//   ).obs;

//   AuthService authService = AuthService();

//   void sendOtp(String phoneNumber, String role) async {
//     try {
//       isLoading(true);
//       OtpResponse? response = await authService.sendOtp(phoneNumber, role);
//       if (response != null) {
//         otpResponse.value = response;
//         print('Success: ${response.message}');
//         // Get.to(OtpVerifiedScreen());
//       }
//     } catch (e, stacktrace) {
//       print('Error: ${e.toString()}');
//       print('Stacktrace: $stacktrace');
//     } finally {
//       isLoading(false);
//     }
//   }

//   Future<bool> verifyOtp(
//     String phoneNumber,
//     String otpCode,
//   ) async {
//     try {
//       print(
//           "Verifying OTP: $otpCode for Phone Number: $phoneNumber and "); // Debug line
//       isLoading(true);
//       OtpResponse? response = await authService.verifyOtp(
//         phoneNumber,
//         otpCode,
//       );
//       if (response != null && response.success) {
//         otpResponse.value = response;

//         print('OTP Verification Success: ${response.message}');
//         return true; // Return true on success
//       } else {
//         throw Exception(response?.message ?? "Unknown error");
//       }
//     } catch (e) {
//       print('Error during OTP verification: ${e.toString()}');
//       return false; // Return false on failure
//     } finally {
//       isLoading(false);
//     }
//   }

//   void setOtpCode(String code) {
//     otpCode.value = code; // Set the OTP code
//   }



//   // Updated setPassword to include role
//   void setPassword(String newPassword, String role) async {
//     Map<String, String> userData = {
//       'phoneNumber': forgotController.emailController.text,
//       'newPassword': newPassword,
//       'role': role, // Added role to the userData map
//     };

//     debugPrint("userData: $userData");

//     final url = Uri.parse(ApiUrl.verifyOtpUrl);

//     var response = await http.patch(url, body: userData);

//     debugPrint("Response Code: ${response.statusCode}");
//     debugPrint("Response Success: ${jsonDecode(response.body)['success']}");

//     if (response.statusCode == 200) {
//       if (jsonDecode(response.body)['success'] == true) {
//         Get.off(() => LoginScreen());
//       }
//     }
//   }










// }
