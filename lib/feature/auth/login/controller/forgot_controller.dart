import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotController extends GetxController {
  TextEditingController emailController = TextEditingController();
  var isFormValid = false.obs;  // Observable variable for reactivity

  @override
  void onInit() {
    super.onInit();
    emailController.addListener(validateForm);
  }

  void validateForm() {
    isFormValid.value = emailController.text.isNotEmpty;  // Update the reactive variable
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
