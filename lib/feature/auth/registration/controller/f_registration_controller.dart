import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rydleap/feature/auth/otp/f_otp_screen.dart';

class FRegistrationController extends GetxController {
  final TextEditingController phoneController =
      TextEditingController(text: "+8801521205808");
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  var isLoading = false.obs;
  var otpSent = false.obs;
  var verificationId = ''.obs;

  // Timer related variables
  Timer? _timer;
  var _start =
      119.obs; // Countdown starting from 1 minute 59 seconds (119 seconds)

  // Method to handle Google Sign-In
  Future<void> signInWithGoogle() async {
    isLoading(true);
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        if (userCredential.user != null) {
          Get.toNamed('/name_email_screen');
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Google Sign-In failed: $e');
    } finally {
      isLoading(false);
    }
  }

  // Method to send OTP for Phone Authentication
  Future<void> sendOTP() async {
    isLoading(true);
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneController.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          Get.to(FOtpScreen());
        },
        verificationFailed: (FirebaseAuthException e) {
          print('Phone number verification failed: ${e.message}');
        },
        codeSent: (String verificationId, int? resendToken) {
          this.verificationId.value = verificationId;
          otpSent(true);
          Get.snackbar('Success', 'OTP sent to ${phoneController.text}');
          startTimer(); // Start countdown when OTP is sent
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          this.verificationId.value = verificationId;
        },
        timeout: const Duration(seconds: 60),
      );
    } catch (e) {
      Get.snackbar('Error', 'Failed to send OTP: $e');
    } finally {
      isLoading(false);
    }
  }

  // Method to verify OTP and sign in the user
  Future<bool> verifyOTP(String otp) async {
    isLoading(true);
    try {
      print("Entered OTP: $otp");
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId.value,
        smsCode: otp,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      if (userCredential.user != null) {
        print(
            'OTP verification successful. User signed in: ${userCredential.user?.phoneNumber}');
        return true; // OTP verified successfully
      } else {
        print('OTP verification failed: userCredential is null');
        return false;
      }
    } catch (e) {
      print('Error during OTP verification: $e');
      Get.snackbar('Error', 'Invalid OTP: $e');
      return false;
    } finally {
      isLoading(false);
    }
  }

  // Method to sign out the user
  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    Get.offAllNamed('/login_screen');
  }

  // Timer-related methods

  // Start timer method
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start.value > 0) {
        _start.value--;
      } else {
        _timer?.cancel();
      }
    });
  }

  // Reset timer method
  void resetTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    _start.value = 119; // Reset to 1 minute 59 seconds
    startTimer(); // Restart the timer
  }

  // Get formatted timer text (e.g., "1:59s")
  String get timerText {
    int minutes = _start.value ~/ 60;
    int seconds = _start.value % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}s';
  }

  @override
  void dispose() {
    _timer
        ?.cancel(); // Ensure the timer is canceled when the controller is disposed
    super.dispose();
  }
}
