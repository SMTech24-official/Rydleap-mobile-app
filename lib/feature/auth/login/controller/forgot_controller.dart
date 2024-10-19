import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/api_url.dart';
import 'package:http/http.dart' as http;

class ForgotController extends GetxController {
  TextEditingController emailController = TextEditingController();
  var isFormValid = false.obs;

  void sendMail() async {
    Map<String, String> userData = Map();

    userData['phoneNumber'] = emailController.text;

    debugPrint("userData" + userData.toString());
    //
    final url = Uri.parse(ApiUrl.baseUrl + '/api/v1/otp/send-otp');

    var response = await http.post(url, body: userData);

    debugPrint(
        "Response Code..................." + response.statusCode.toString());
    debugPrint("Response Success:..................." +
        jsonDecode(response.body)['success'].toString());

    debugPrint(
        '++++++++++++++++++++++++++++${jsonDecode(response.body)['data']['body']}+++++++++++++++++++++++++');

    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['success'] == true) {
        // Get.to(()=>OtpScreen2());
      }

      // Get.to(()=>OtpScreen2());
    }

    // if (response.statusCode == 200) {
    //   var jsonResponse = jsonDecode(response.body);
    //
    //   debugPrint("Response body..................." + jsonResponse.toString());

    //   try {
    //     if (jsonResponse['success'] == true) {
    //       return true;
    //     } else {
    //
    //       showSnackBar('Caution', jsonResponse["errors"],Colors.white, SnackPosition.BOTTOM);
    //
    //       return false;
    //     }
    //   } catch (e) {
    //     debugPrint(e.toString());
    //   }
    // }
    // else {
    //   var jsonResponse = jsonDecode(response.body);
    //   showSnackBar('Caution', jsonResponse["errors"],Colors.white, SnackPosition.BOTTOM);
    //   return false;
    // }
  }

  // Observable variable for reactivity

  @override
  void onInit() {
    super.onInit();
    emailController.addListener(validateForm);
  }

  void validateForm() {
    isFormValid.value =
        emailController.text.isNotEmpty; // Update the reactive variable
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
