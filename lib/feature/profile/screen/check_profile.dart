import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/share_pref/share_pref.dart';
import 'package:rydleap/feature/auth/login/controller/login_controller.dart';
import 'package:rydleap/feature/profile/controller/profile_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/profile_model.dart';

class UserProfilePage extends StatelessWidget {
  final ProfileController userController = Get.put(ProfileController());
  final LoginController _loginController = Get.put(LoginController());

  UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        actions: [
          Obx(() {
            if (_loginController.loading.value) {
              return Center(child: CircularProgressIndicator());
            } else {
              return IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  _loginController.logout();
                },
              );
            }
          }),
        ],
      ),
      body: Center(
        child: Obx(() {
          if (userController.isLoading.value) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text('Loading user data...'),
              ],
            );
          } else if (userController.errorMessage.isNotEmpty) {
            // Display error message if any
            return Text(
              userController.errorMessage.value,
              style: TextStyle(color: Colors.red, fontSize: 16),
            );
          } else if (userController.user.value == null) {
            return Text('No user data available');
          } else {
            // Safely access user properties
            User user = userController.user.value!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: ${userController.email.value ?? "Not provided"}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  FutureBuilder<String?>(
                    future: SharePref
                        .getSavedEmail(), // The future that fetches the email
                    builder: (BuildContext context,
                        AsyncSnapshot<String?> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text(
                          'Loading...', // Show loading state
                          style: TextStyle(fontSize: 18),
                        );
                      } else if (snapshot.hasError) {
                        return Text(
                          'Error: ${snapshot.error}', // Show error message
                          style: TextStyle(fontSize: 18),
                        );
                      } else if (snapshot.hasData && snapshot.data != null) {
                        return Text(
                          'Email: ${snapshot.data}', // Show the retrieved email
                          style: TextStyle(fontSize: 18),
                        );
                      } else {
                        return Text(
                          'Email: Not provided', // Fallback if no email is found
                          style: TextStyle(fontSize: 18),
                        );
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Implement profile editing or other functionality here
                    },
                    child: Text('Edit Profile'),
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
