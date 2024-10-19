import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:rydleap/feature/auth/login/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FProfileController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var isLoading = false.obs; // Observed variable for loading state

  // Method to check if the user is logged in
  bool get isUserLoggedIn => _auth.currentUser != null;

  // Method to fetch user data from Firestore
  Future<Map<String, dynamic>?> fetchUserData() async {
    try {
      // Get the current user's UID
      User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        DocumentSnapshot userSnapshot =
            await _firestore.collection('users').doc(currentUser.uid).get();
        if (userSnapshot.exists) {
          return userSnapshot.data() as Map<String, dynamic>;
        }
      } else {
        print("No user is currently logged in.");
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
    return null;
  }

  // Method to log out the user
  Future<void> logout() async {
    isLoading.value = true; // Set loading to true at the beginning
    try {
      await _auth.signOut();
      print("User logged out successfully.");

      // Clear any stored user data here if applicable
      // For example, using SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', false); // Clear login state

      // Optionally, navigate to the login screen
      Get.to(LoginScreen()); // Adjust the route name as needed
    } catch (e) {
      print("Error logging out: $e");
    } finally {
      isLoading.value = false; // Ensure loading is false at the end
    }
  }
}
