import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rydleap/feature/profile/screen/profile_screen.dart';

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
        // Handle successful login for email
        Get.snackbar("Success", "Logged in successfully with email",
            backgroundColor: Colors.green, colorText: Colors.white);
        Get.to(ProfileScreen());
        // Do something with userCredential if needed
      } else if (_isPhoneNumber(identifier)) {
        // Phone Number Login
        // You may want to implement verification code flow for phone login
        await _auth.verifyPhoneNumber(
          phoneNumber: identifier,
          verificationCompleted: (PhoneAuthCredential credential) async {
            // Auto-retrieval or instant verification
            await _auth.signInWithCredential(credential);
            Get.snackbar("Success", "Logged in successfully with phone",
                backgroundColor: Colors.green, colorText: Colors.white);
          },
          verificationFailed: (FirebaseAuthException e) {
            Get.snackbar("Error", e.message ?? "Verification failed",
                backgroundColor: Colors.red, colorText: Colors.white);
          },
          codeSent: (String verificationId, int? resendToken) {
            // You can handle the code sent logic here
            Get.snackbar("Code Sent", "Verification code sent to $identifier",
                backgroundColor: Colors.orange, colorText: Colors.white);
            // Store verificationId for later use
            // Implement UI to get verification code and sign in
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            // Auto-retrieval timeout
          },
        );
      } else {
        Get.snackbar("Error", "Please enter a valid email or phone number",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  bool _isEmail(String identifier) {
    // Basic email validation
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(identifier);
  }

  bool _isPhoneNumber(String identifier) {
    // Basic phone number validation (You may want to use a better validation based on your requirements)
    final phoneRegex =
        RegExp(r'^\+?[0-9]{10,15}$'); // Adjust the regex as per your needs
    return phoneRegex.hasMatch(identifier);
  }
}
