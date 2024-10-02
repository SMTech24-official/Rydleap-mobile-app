






import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rydleap/core/share_pref/share_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:rydleap/feature/auth/domain/model/user_model.dart';

import 'model/user_model.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController{




  Rx<UserModel> userDetail=UserModel().obs;



  Future<void> getUserDetail(String accessToken) async {



    Map<String, String> headers = {
      "Authorization": "$accessToken",


      //"Bearer ${SharePref.getUserAccessToken()}",
    };

    final url = Uri.parse('https://rydleaps.vercel.app/api/v1/auth/get-me');
    var response = await http.get(
      url,
      headers: headers,
    );

    // log('log me', name: response.body);

     debugPrint("+++++++++++status code....."+response.statusCode.toString());


    if (response.statusCode == 201) {

      userDetail.value= userModelFromJson(response.body);


      debugPrint("+++++++++++++++++++++++++++User Data++++++++++++++++++++++"+response.body);
      //return userModelFromJson(response.body);
    } else if (response.statusCode == 400) {
      throw const HttpException('getCustomerAddressData Error');
    } else {
      throw const HttpException('getCustomerAddressData Error');
    }
  }

  @override
  void onInit() {
    super.onInit();
    //fetchTransactionList()  ;






  }

  @override
  void onClose() {

  }

  @override
  void onReady() {

  }
}