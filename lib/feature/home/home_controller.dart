






import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rydleap/core/share_pref/share_pref.dart';
import 'package:rydleap/feature/home/model/promotion_model.dart';
import 'package:rydleap/feature/home/model/riding_history_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:rydleap/feature/auth/domain/model/user_model.dart';

import 'model/user_model.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController{




  Rx<UserModel> userDetail=UserModel().obs;
  Rx<RidingHistoryModel> ridingHistoryModel=RidingHistoryModel().obs;
  Rx<PromotionModel> promotionModel=PromotionModel().obs;



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



  Future<void> getPromo() async {

    print('into promo');
      debugPrint("++++++++++++++++++Start++++++++++++++++++++++");


    final url = Uri.parse('https://rydleaps.vercel.app/api/v1/promotions');
    var response = await http.get(
      url,
    );

    // log('log me', name: response.body);

    debugPrint("+++++++++++status code....."+response.statusCode.toString());


    debugPrint("+++++++++++++++++++++++++++Promo Data++++++++++++++++++++++"+response.body);


    if (response.statusCode == 200) {

      promotionModel.value= promotionModelFromJson(response.body);


      debugPrint("+++++++++++++++++++++++++++ OK Data++++++++++++++++++++++"+response.body);
      //return userModelFromJson(response.body);
    } else if (response.statusCode == 400) {
      throw const HttpException('getCustomerAddressData Error');
    } else {
      throw const HttpException('getCustomerAddressData Error');
    }
  }





  // Future<void> getRidingHistory() async {
  //
  //   print('into promo');
  //   debugPrint("++++++++++++++++++Start++++++++++++++++++++++");
  //
  //
  //   final url = Uri.parse('https://rydleaps.vercel.app/api/v1/ride-history');
  //   var response = await http.get(
  //     url,
  //   );
  //
  //   // log('log me', name: response.body);
  //
  //   debugPrint("+++++++++++status code....."+response.statusCode.toString());
  //
  //
  //   debugPrint("+++++++++++++++++++++++++++Riding Data++++++++++++++++++++++"+response.body);
  //
  //
  //   if (response.statusCode == 200) {
  //
  //     ridingHistoryModel.value= ridingHistoryModelFromJson(response.body);
  //
  //
  //     debugPrint("+++++++++++++++++++++++++++ OK Riding History Data++++++++++++++++++++++"+response.body);
  //     //return userModelFromJson(response.body);
  //   } else if (response.statusCode == 400) {
  //     throw const HttpException('getCustomerAddressData Error');
  //   } else {
  //     throw const HttpException('getCustomerAddressData Error');
  //   }
  // }




  Future<void> getRidingHistory() async {



    Map<String, String> headers = {
      "Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2ZWI4ZGFkOGY5MzdjYWU1ZWM1MjEzNSIsImVtYWlsIjoicmlkZXJAZ21haWwuY29tIiwicm9sZSI6IlVTRVIiLCJpYXQiOjE3Mjc5NDkxMDEsImV4cCI6MTcyODAzNTUwMX0.NHn-e77UT6H_2vNjdnt4z9qJ8-B2xITl0wwkvvBasX0",


      //"Bearer ${SharePref.getUserAccessToken()}",
    };

    final url = Uri.parse('https://rydleap-backend-eight.vercel.app/api/v1/ride-history');
    var response = await http.get(
      url,
      headers: headers,
    );

    // log('log me', name: response.body);

    debugPrint("+++++++++++Riding history code....."+response.statusCode.toString());


    if (response.statusCode == 200) {

      ridingHistoryModel.value= ridingHistoryModelFromJson(response.body);


      debugPrint("+++++++++++++++++++++++++++Riding History Data++++++++++++++++++++++"+response.body);
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

    // getPromotion();

    getPromo();
    getRidingHistory();






  }

  @override
  void onClose() {

  }

  @override
  void onReady() {

  }
}