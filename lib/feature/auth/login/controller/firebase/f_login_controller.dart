import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rydleap/core/global_widgets/custom_snackbar.dart';
import 'package:rydleap/core/share_pref/share_pref.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences
import 'package:rydleap/feature/profile/screen/f_profile_screen.dart';

class FLoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var isLoading = false.obs;

  Future<void> login(String identifier, String password) async {
    isLoading.value = true;

    // Declare userCredential as nullable
    UserCredential? userCredential;

    try {
      // Check if identifier is email or phone number
      if (_isEmail(identifier)) {
        // Email login
        userCredential = await _auth.signInWithEmailAndPassword(
          email: identifier,
          password: password,
        );
      } else if (_isPhoneNumber(identifier)) {
        // Phone number login logic (simplified)
        // Set the userCredential here if phone login is successful
        // Placeholder for handling phone login
        await _auth.verifyPhoneNumber(
          phoneNumber: identifier,
          verificationCompleted: (PhoneAuthCredential credential) async {
            userCredential = await _auth.signInWithCredential(credential);
          },
          verificationFailed: (FirebaseAuthException e) {
            errorToast(message: "Verification failed");
            return;
          },
          codeSent: (String verificationId, int? resendToken) {
            Get.snackbar("Code Sent", "Verification code sent to $identifier",
                backgroundColor: Colors.orange, colorText: Colors.white);
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            // Auto-retrieval timeout logic
          },
        );
      } else {
        errorToast(message: "Please enter a valid email or phone number");
        return;
      }

      // Ensure userCredential is not null before proceeding
      if (userCredential == null || userCredential?.user == null) {
        errorToast(message: "Login failed. Please try again.");
        return;
      }

      // Get and save the FCM token
      String? fcmToken = await FirebaseMessaging.instance.getToken();
      if (fcmToken != null) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true); // Save login state
        await SharePref.saveFcmToken(fcmToken); // Save FCM token

        // Update Firestore with FCM token
        await _firestore
            .collection('users')
            .doc(userCredential!.user?.uid)
            .update({'fcm_token': fcmToken});
        print('FCM Token saved: $fcmToken');
      }

      successToast(message: "Logged in successfully");
      Get.to(FProfileScreen());
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
