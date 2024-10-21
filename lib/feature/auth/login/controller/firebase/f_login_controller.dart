import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rydleap/core/global_widgets/custom_snackbar.dart';
import 'package:rydleap/core/share_pref/share_pref.dart';
import 'package:rydleap/feature/profile/widgets/notifcation/notification_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rydleap/feature/profile/screen/f_profile_screen.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FLoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var isLoading = false.obs;

  Future<void> login(String identifier, String password) async {
    isLoading.value = true;

    Map<String, dynamic> loginData = {
      "identifier": identifier,
      "password": password,
    };

    print('Login Data (JSON Format): ${loginData.toString()}');

    UserCredential? userCredential;

    try {
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
          codeAutoRetrievalTimeout: (String verificationId) {},
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
        await prefs.setBool('isLoggedIn', true);
        await SharePref.saveFcmToken(fcmToken);

        await _firestore
            .collection('users')
            .doc(uid)
            .update({'fcm_token': fcmToken});
        print('FCM Token saved: $fcmToken');
      }
      print("fcm $fcmToken");
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

      String? email = userCredential!.user!.email;

      if (email == null) {
        errorToast(message: "Email not found. Cannot proceed.");
        return;
      }

      await saveData(email, fcmToken!, userData);
      successToast(message: "Logged in successfully");
    } catch (e) {
      print("------------------$e");
      errorToast(message: "Something wrong please try again");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> saveData(
      String email, String fcmToken, Map<String, dynamic> userData) async {
    try {
      print("///////////$fcmToken");
      Map<String, dynamic> modifiedUserData = Map.from(userData);
      modifiedUserData.remove('email');
      modifiedUserData.remove('fcm_token');

      Map<String, dynamic> requestBody = {
        "fullName": userData["full_name"],
        // "phoneNumber": userData["phone"],
      };

      final response = await http.patch(
        Uri.parse(
            "https://rydleap-backend-eight.vercel.app/api/v1/auth/update-fcp/${email}/${fcmToken}"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );
      print("req ${requestBody}");
      print(
          "//////////https://rydleap-backend-eight.vercel.app/api/v1/auth/update-fcp/${email}/${fcmToken}");
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
      errorToast(message: "Something wrong please try again");
      // errorToast(message: "Error saving data: $e");
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

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void onInit() {
    super.onInit();

    _initializeNotifications();

    messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      announcement: true,
      criticalAlert: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Received a foreground message: ${message.notification?.title}');
      _showNotification(
        message.notification?.title,
        message.notification?.body,
        message.data,
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Notification clicked! Opened app from background or terminated.');
      _navigateToDetails(message);
    });

    _checkForInitialMessage();
  }

  Future<void> _checkForInitialMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      _navigateToDetails(initialMessage);
    }
  }

  void _navigateToDetails(RemoteMessage message) {
    Get.to(() => NotificationScreen());
  }

  Future<void> _initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        if (response.payload != null) {
          Get.to(() => NotificationScreen());
        }
      },
    );

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  Future<void> _showNotification(
      String? title, String? body, Map<String, dynamic> data) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'high_importance_channel',
      'High Importance Notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: body,
    );
  }
}
