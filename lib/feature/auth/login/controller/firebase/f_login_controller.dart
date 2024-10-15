import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rydleap/core/global_widgets/custom_snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences
import 'package:rydleap/feature/profile/screen/f_profile_screen.dart';

class FLoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var isLoading = false.obs;

  Future<void> login(String identifier, String password) async {
    isLoading.value = true;
    try {
      // Determine if the identifier is an email or a phone number
      if (_isEmail(identifier)) {
        // Email/Password Login
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: identifier,
          password: password,
        );

        // Save login state to SharedPreferences
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true); // User is logged in

        // Handle successful login for email
        successToast(
          message: "Logged in successfully with email",
        );
        Get.to(FProfileScreen());
      } else if (_isPhoneNumber(identifier)) {
        // Phone Number Login
        await _auth.verifyPhoneNumber(
          phoneNumber: identifier,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await _auth.signInWithCredential(credential);
            // Save login state to SharedPreferences
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            await prefs.setBool('isLoggedIn', true); // User is logged in
            successToast(message: "Logged in successfully");
          },
          verificationFailed: (FirebaseAuthException e) {
            errorToast(message: "Verification failed");
          },
          codeSent: (String verificationId, int? resendToken) {
            Get.snackbar("Code Sent", "Verification code sent to $identifier",
                backgroundColor: Colors.orange, colorText: Colors.white);
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            // Auto-retrieval timeout
          },
        );
      } else {
        errorToast(message: "Please enter a valid email or phone number");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  bool _isEmail(String identifier) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(identifier);
  }

  bool _isPhoneNumber(String identifier) {
    final phoneRegex =
        RegExp(r'^\+?[0-9]{10,15}$'); // Adjust the regex as per your needs
    return phoneRegex.hasMatch(identifier);
  }
}
