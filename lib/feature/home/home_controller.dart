import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rydleap/feature/home/model/all_riders_model.dart';
import 'package:rydleap/feature/home/model/package_model.dart';
import 'package:rydleap/feature/home/model/promotion_model.dart';
import 'package:rydleap/feature/home/model/riding_history_model.dart';


import 'model/user_model.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController{



  Set<Marker> markers = <Marker>{};



  String accessToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3MGM5NTkyYTJkZjcxZDkwOGJhN2MzYiIsImVtYWlsIjoic2Fnb3JAZ21haWwuY29tIiwicm9sZSI6IlVTRVIiLCJpYXQiOjE3MjkyMzEwMjcsImV4cCI6MTczMTgyMzAyN30.t6hXXeAzxkqG4bQqRZMvwZ1ZIK75YVpzMFk40F7anLY';




  Rx<UserModel> userDetail=UserModel().obs;
  Rx<RidingHistoryModel> ridingHistoryModel=RidingHistoryModel().obs;
  Rx<PromotionModel> promotionModel=PromotionModel().obs;
  Rx<AllRidersModel> allRidersModel=AllRidersModel().obs;
  Rx<PackageModel> packageModel=PackageModel(data: []).obs;



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



  Future<void> getUser() async {





    final url = Uri.parse('https://rydleap-backend-eight.vercel.app/api/v1/users/67075b4606381f338df574a6');
    var response = await http.get(
      url,
    );

    // log('log me', name: response.body);

    debugPrint("+++++++++++status code....."+response.statusCode.toString());


    if (response.statusCode == 200) {

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

    Map<String, String> headers = {
      "Authorization": "$accessToken",
      "Content-Type": "application/json",
      //"Bearer ${SharePref.getUserAccessToken()}",
    };


    final url = Uri.parse('https://rydleap-backend-eight.vercel.app/api/v1/promotions');
    var response = await http.get(
      url,
      headers: headers
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


  Future<void> getPackage() async {

    print('into Packages');
    debugPrint("++++++++++++++++++Start++++++++++++++++++++++");


    final url = Uri.parse('https://rydleap-backend-eight.vercel.app/api/v1/package');
    var response = await http.get(
      url,
    );

    // log('log me', name: response.body);

    debugPrint("+++++++++++status code....."+response.statusCode.toString());


    debugPrint("+++++++++++++++++++++++++++Package Data++++++++++++++++++++++"+response.body);


    if (response.statusCode == 200) {

      packageModel.value= packageModelFromJson(response.body);



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




  Future<void> getAllRiders() async {



    Map<String, String> headers = {
      "Authorization": accessToken,
      //"Bearer ${SharePref.getUserAccessToken()}",
    };

    final url = Uri.parse('https://rydleap-backend-eight.vercel.app/api/v1/users/riders');
    var response = await http.get(
      url,
      headers: headers,
    );

    // log('log me', name: response.body);

    debugPrint("+++++++++++All riders code....."+response.statusCode.toString());


    if (response.statusCode == 200) {

      allRidersModel.value= allRidersModelFromJson(response.body);

      for(int i=0;i<allRidersModel.value.data!.data!.length;i++){
        
        if(allRidersModel.value.data!.data![i].locations!=null){
          // markers.add()
        }
        
      }


      debugPrint("+++++++++++++++++++++++++++All riders data ++++++++++++++++++++++"+response.body);
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
    getPackage();
    getUser();
    getAllRiders();






  }

  @override
  void onClose() {

  }

  @override
  void onReady() {

  }
}