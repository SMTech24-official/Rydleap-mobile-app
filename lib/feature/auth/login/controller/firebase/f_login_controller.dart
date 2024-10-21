import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rydleap/core/global_widgets/custom_snackbar.dart';
import 'package:rydleap/core/share_pref/share_pref.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences
import 'package:rydleap/feature/profile/screen/f_profile_screen.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class FLoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var isLoading = false.obs;

  Future<void> login(String identifier, String password) async {
    isLoading.value = true;

    // Prepare the data to print before login
    Map<String, dynamic> loginData = {
      "identifier": identifier,
      "password":
          password, // Be careful about printing sensitive data like passwords in production
    };

    // Print the login data as JSON before proceeding
    print('Login Data (JSON Format): ${loginData.toString()}');

    UserCredential? userCredential;

    try {
      // Check if identifier is email or phone number
      if (_isEmail(identifier)) {
        print('Logging in with email...');
        userCredential = await _auth.signInWithEmailAndPassword(
          email: identifier,
          password: password,
        );
      } else if (_isPhoneNumber(identifier)) {
        print('Logging in with phone number...');
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

      if (userCredential == null || userCredential!.user == null) {
        errorToast(message: "Login failed. Please try again.");
        return;
      }

      String uid = userCredential!.user!.uid;
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(uid).get();

      if (!userDoc.exists) {
        errorToast(message: "User details not found.");
        return;
      }

      String? fcmToken = await FirebaseMessaging.instance.getToken();
      if (fcmToken != null) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true); // Save login state
        await SharePref.saveFcmToken(fcmToken); // Save FCM token

        await _firestore
            .collection('users')
            .doc(uid)
            .update({'fcm_token': fcmToken});
        print('FCM Token saved: $fcmToken');
      }

      Map<String, dynamic> userData = {
        "full_name": userDoc.get('full_name'),
        "email": userCredential!.user!.email,
        "password": password,
        "phone": userDoc.get('phone'),
        "image": userDoc.get('image'),
        "role": userDoc.get('role'),
        "fcm_token": fcmToken,
      };

      print('User Data (JSON Format): ${userData.toString()}');

// Get.to(() => FProfileScreen());
      String? email = userCredential!.user!.email;

      if (email == null) {
        errorToast(message: "Email not found. Cannot proceed.");
        return;
      }

      await saveData(email, fcmToken!, userData);
      successToast(message: "Logged in successfully");
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  // Method to save user data and post to API with email and fcm_token as parameters
  Future<void> saveData(
      String email, String fcmToken, Map<String, dynamic> userData) async {
    try {
      // Remove email and fcm_token from userData if they exist in the map
      Map<String, dynamic> modifiedUserData = Map.from(userData);
      modifiedUserData.remove('email');
      modifiedUserData.remove('fcm_token');

      // Construct the request body to include email and fcm_token as parameters
      Map<String, dynamic> requestBody = {
        "fullName": userData["full_name"],
        "phone": userData["phone"],
        "role": userData["role"],
      };

      // Perform the PATCH request
      final response = await http.patch(
        Uri.parse(
            "https://rydleap-backend-eight.vercel.app/api/v1/auth/update-fcp/${email}/${fcmToken}"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );
      print(' save data: ${response.body}');

      if (response.statusCode == 200) {
        Get.to(() => FProfileScreen());
        print('Data successfully saved to the server');
        print("req $requestBody");
      } else {
        print("response ${response.body}");
        print('Failed to save data: ${response.statusCode}');
        errorToast(message: "Failed to save data");
      }
    } catch (e) {
      print('Error saving data: $e');
      errorToast(message: "Error saving data: $e");
    }
  }

  bool _isEmail(String identifier) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(identifier);
  }

  bool _isPhoneNumber(String identifier) {
    final phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');
    return phoneRegex.hasMatch(identifier);
  }
}
