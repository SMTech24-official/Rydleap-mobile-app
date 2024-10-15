import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rydleap/core/global_widgets/custom_snackbar.dart';
import 'package:rydleap/core/service/notification_service.dart';
import 'package:rydleap/feature/auth/login/login_screen.dart';
import 'package:rydleap/feature/auth/user_input/user_input_details.dart';

class EmailRegistrationController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final ImagePicker _picker = ImagePicker();
  Rx<File?> selectedImage = Rx<File?>(null);

  String? fcmToken; // Changed variable name to fcmToken
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _getFCMToken(); // Change method name to get FCM token
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> _getFCMToken() async {
    try {
      // Fetch FCM token
      fcmToken = await FirebaseMessaging.instance
          .getToken(); // Directly get the FCM token
      print("FCM Token: $fcmToken");
    } catch (e) {
      print("Failed to get FCM token: $e");
    }
  }

  Future<void> onSignUp(UserInputDetails userInput) async {
    // Check if all required fields are filled
    if (userInput.fullName.isEmpty ||
        userInput.phoneNumber.isEmpty ||
        userInput.email.isEmpty ||
        userInput.password.isEmpty ||
        userInput.confirmPassword.isEmpty) {
      errorToast(message: "Please fill all required fields");

      return;
    }

    // Example email format validation
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(userInput.email)) {
      errorToast(message: "Please enter a valid email");

      return;
    }

    // Example password strength check (minimum 6 characters)
    if (userInput.password.length < 6) {
      errorToast(
        message: "Password must be at least 6 characters",
      );

      return;
    }

    // Check if password and confirm password match
    if (userInput.password != userInput.confirmPassword) {
      errorToast(
        message: "Passwords do not match",
      );

      return;
    }

    isLoading.value = true;
    try {
      String imageUrl = "";
      if (selectedImage.value != null) {
        // Upload image to Firebase Storage if it exists
        imageUrl = await _uploadImage(selectedImage.value!);
      }

      // Prepare registration data
      Map<String, dynamic> registrationData = {
        "full_name": userInput.fullName,
        "phone": userInput.phoneNumber,
        "email": userInput.email,
        "image": imageUrl,
        "fcm_token": fcmToken, // Use fcmToken instead of deviceToken
        "role": userInput.role, // Include the role
      };

      // Create the user in Firebase Auth
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: userInput.email,
        password: userInput.password,
      );

      // Save the user data to Firestore
      await _firestore
          .collection("users")
          .doc(userCredential.user?.uid)
          .set(registrationData);

      // Update FCM token in the Firestore collection
      if (fcmToken != null) {
        await _firestore
            .collection("users")
            .doc(userCredential.user?.uid)
            .update({"fcm_token": fcmToken});
      }
      successToast(message: "Registration completed successfully");
      Get.to(LoginScreen());

      // Clear input fields
    } catch (e) {
      print(e);
      Get.snackbar("Error", e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  Future<String> _uploadImage(File image) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference storageReference =
        FirebaseStorage.instance.ref().child("profile_images/$fileName");

    UploadTask uploadTask = storageReference.putFile(image);
    TaskSnapshot snapshot = await uploadTask;

    return await snapshot.ref.getDownloadURL();
  }

  void showImageSourceSelection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () {
                _pickImage(ImageSource.camera);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () {
                _pickImage(ImageSource.gallery);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
  }
}
