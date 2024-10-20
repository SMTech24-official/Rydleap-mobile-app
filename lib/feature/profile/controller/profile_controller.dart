import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rydleap/core/share_pref/share_pref.dart';
import 'package:rydleap/feature/auth/domain/model/user_model.dart';
import 'package:rydleap/feature/profile/model/profile_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  var user = Rxn<User>();
  var isLoading = false.obs;
  var errorMessage = ''.obs; // Reactive variable for errors
  var email = ''.obs;

  // Rx<UserModel> userDetail=UserModel().obs;





  Future<void> getUserDetail(/*String accessToken*/) async {



    // Map<String, String> headers = {
    //   "Authorization": "$accessToken",
    //
    //
    //   //"Bearer ${SharePref.getUserAccessToken()}",
    // };

    final url = Uri.parse('https://rydleap-backend-eight.vercel.app/api/v1/users/67075b4606381f338df574a6');
    var response = await http.get(
      url,
      // headers: headers,
    );

    // log('log me', name: response.body);

    debugPrint("+++++++++++status code....."+response.statusCode.toString());


    // if (response.statusCode == 201) {
    //
    //   userDetail.value= UserModelFromJson(response.body);
    //
    //
    //    debugPrint("+++++++++++++++++++++++++++User Data++++++++++++++++++++++"+response.body);
    //   //return userModelFromJson(response.body);
    // } else if (response.statusCode == 400) {
    //   throw const HttpException('getCustomerAddressData Error');
    // } else {
    //   throw const HttpException('getCustomerAddressData Error');
    // }



  }


  @override
  void onInit() {
    super.onInit();

    getUserDetail();



  }

  Future<void> fetchUser(String userId) async {
    final url = Uri.parse('https://rydleaps.vercel.app/api/v1/auth/get-me');

    // try {
    //   isLoading.value = true;
    //   errorMessage.value = ''; // Reset any previous error

    //   // String? accessToken = await SharePref.getUserAccessToken();

    //   // // Check if access token is available
    //   // if (accessToken == null || accessToken.isEmpty) {
    //   //   throw Exception("Access token not found. Please log in.");
    //   // }

    //   // print('Access Token: $accessToken'); // Debugging: Check the exact token sent

    //   // // Make the GET request
    //   // final response = await http.get(
    //   //   url,
    //   //   headers: {
    //   //     "Content-Type": "application/json",
    //   //     "Authorization": "$accessToken", // Ensure 'Bearer ' is included
    //   //   },
    //   // );

    //   // Check the status code and process the response accordingly
    //   if (response.statusCode == 201) {
    //     final jsonResponse = json.decode(response.body);
    //     print("///////////////////////////// ${jsonResponse['data']['email']}///////////////////////////");
    //     user.value = User.fromJson(jsonResponse);
    //     print(user.value.toString());
    //     // await SharePref.getUserData();
    //     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    //     sharedPreferences.setString('email', jsonResponse['data']['email']);
    //     email.value =  jsonResponse['data']['email'];

    //   } else {
    //     // Handling specific status codes for better error messaging
    //     if (response.statusCode == 401) {
    //       errorMessage.value = 'Unauthorized: Please check your login credentials.';
    //     } else if (response.statusCode == 404) {
    //       errorMessage.value = 'User not found.';
    //     } else {
    //       errorMessage.value = 'Failed to fetch user, status code: ${response.statusCode}';
    //     }
    //     print('Error Response Body: ${response.body}'); // Log the response for debugging
    //   }
    // } catch (e) {
    //   // Log and display the error message
    //   errorMessage.value = 'Error: ${e.toString()}';
    // } finally {
    //   isLoading.value = false; // Ensure loading state is updated
    // }
  }

  @override
  void onReady() {

  }

  @override
  void onClose() {

  }
}
