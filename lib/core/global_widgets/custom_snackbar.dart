import 'package:flutter/material.dart';
import 'package:get/get.dart';

void successToast({
  required String message,
  Color backgroundColor = Colors.green,
  Color textColor = Colors.white,
  SnackPosition snackPosition = SnackPosition.TOP, // Optional position
  Duration duration = const Duration(seconds: 3), // Optional duration
}) {
  Get.snackbar(
    "Success",
    message,
    backgroundColor: backgroundColor,
    colorText: textColor,
    snackPosition: snackPosition,
    duration: duration,
    margin: const EdgeInsets.all(10), // Optional margin
    borderRadius: 8, // Optional border radius
    icon: Icon(
      Icons.check_circle, // Optional icon
      color: textColor,
    ),
  );
}

void errorToast({
  required String message,
  Color backgroundColor = Colors.red,
  Color textColor = Colors.white,
  SnackPosition snackPosition = SnackPosition.TOP, // Optional position
  Duration duration = const Duration(seconds: 3), // Optional duration
}) {
  Get.snackbar(
    "Error",
    message,
    backgroundColor: backgroundColor,
    colorText: textColor,
    snackPosition: snackPosition,
    duration: duration,
    margin: const EdgeInsets.all(10), // Optional margin
    borderRadius: 8, // Optional border radius
    icon: Icon(
      Icons.check_circle, // Optional icon
      color: textColor,
    ),
  );
}
