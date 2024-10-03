import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rydleap/core/service/auth_service.dart';
import 'package:rydleap/feature/auth/login/controller/forgot_controller.dart';
import 'package:rydleap/feature/auth/login/login_screen.dart';
import 'package:rydleap/feature/auth/otp/model/otp_response.dart';

import '../../../../core/api_url.dart';
import 'package:http/http.dart' as http;

import '../../presentaion/screens/create_password.dart';
import '../../presentaion/screens/registration/create_new_password.dart';

class OtpController extends GetxController {


  ForgotController forgotController=Get.find();

  var isLoading = false.obs;
  var otpCode = ''.obs;
  var otpResponse = OtpResponse(
          success: false,
          message: '',
          data: OtpData(
              body: '',
              from: '',
              to: '',
              status: '',
              sid: '',
              dateCreated: DateTime.now()))
      .obs;

  AuthService authService = AuthService();

  void sendOtp(String phoneNumber) async {
    try {
      isLoading(true);
      OtpResponse? response = await authService.sendOtp(phoneNumber);
      if (response != null) {
        otpResponse.value = response;
        print('Success: ${response.message}');
        // Get.to(OtpVerifiedScreen());
      }
    } catch (e, stacktrace) {
      print('Error: ${e.toString()}');
      print('Stacktrace: $stacktrace');
    } finally {
      isLoading(false);
    }
  }

  Future<bool> verifyOtp(String phoneNumber, String otpCode) async {
    try {
      print(
          "Verifying OTP: $otpCode for Phone Number: $phoneNumber"); // Debug line
      isLoading(true);
      OtpResponse? response = await authService.verifyOtp(phoneNumber, otpCode);
      if (response != null && response.success) {
        otpResponse.value = response; // Save the successful response
        print('OTP Verification Success: ${response.message}');
        return true; // Return true on success
      } else {
        throw Exception(response?.message ?? "Unknown error");
      }
    } catch (e) {
      print('Error during OTP verification: ${e.toString()}');
      return false; // Return false on failure
    } finally {
      isLoading(false);
    }
  }

  void setOtpCode(String code) {
    otpCode.value = code; // Set the OTP code
  }





  void varifiOTP() async {


    Map<String, String> userData = Map();

    userData['phoneNumber'] = forgotController.emailController.text;
    userData['otp'] = otpCode.value;


    debugPrint("userData" + userData.toString());
    //
    final url = Uri.parse(ApiUrl.baseUrl +'/api/v1/otp/verify-otp');


    var response = await http.post(url, body: userData);

    debugPrint("Response Code..................." + response.statusCode.toString());
    debugPrint("Response Success:..................." + jsonDecode(response.body)['success'].toString());


    debugPrint('++++++++++++++++++++++++++++${jsonDecode(response.body)['data']['body']}+++++++++++++++++++++++++');


    if(response.statusCode==200){

      if(jsonDecode(response.body)['success']==true){
        Get.to(()=>CreateNewPassword());
      }

      // Get.to(()=>OtpScreen2());

    }


  }



  void setPassword(String newPassword) async {


    Map<String, String> userData = Map();

    userData['phoneNumber'] = forgotController.emailController.text;
    userData['newPassword'] = newPassword;


    debugPrint("userData" + userData.toString());
    //
    final url = Uri.parse(ApiUrl.baseUrl +'/api/v1/auth/reset-password-app');


    var response = await http.patch(url, body: userData);

    debugPrint("Response Code..................." + response.statusCode.toString());
    debugPrint("Response Success:..................." + jsonDecode(response.body)['success'].toString());


    // debugPrint('++++++++++++++++++++++++++++${jsonDecode(response.body)['data']['body']}+++++++++++++++++++++++++');

    //
    if(response.statusCode==200){

      if(jsonDecode(response.body)['success']==true){
        Get.off(()=>LoginScreen());
      }

      // Get.to(()=>OtpScreen2());

    }


  }








}
