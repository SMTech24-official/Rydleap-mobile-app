import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:http/http.dart' as http;
import 'package:rydleap/feature/contact/model/rider_model.dart';

import '../model/contact_model.dart';

class ContactController extends GetxController{







  Rx<RiderModel> riderModel=RiderModel().obs;



  Future<void> getDriver(String driverID) async {

    Map<String, String> headers = {
      "Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3MGM5NTkyYTJkZjcxZDkwOGJhN2MzYiIsImVtYWlsIjoic2Fnb3JAZ21haWwuY29tIiwicm9sZSI6IlVTRVIiLCJpYXQiOjE3MjkzMTY2NTEsImV4cCI6MTczMTkwODY1MX0.hXxC1PP8yuw4rlGdu3-a4fWk6j-qXKW5NaxpPiO7qEk",
      //"Bearer ${SharePref.getUserAccessToken()}",
    };

    print('into Packages');
    debugPrint("++++++++++++++++++Start++++++++++++++++++++++");


    final url = Uri.parse('https://rydleap-backend-eight.vercel.app/api/v1/users/single-rider/${driverID}');
    var response = await http.get(
      url,
      headers: headers
    );

    // log('log me', name: response.body);

    debugPrint("+++++++++++Driver Data status code....."+response.statusCode.toString());


    debugPrint("+++++++++++++++++++++++++++Driver Data++++++++++++++++++++++"+response.body);


    if (response.statusCode == 200) {

      riderModel.value= riderModelFromJson(response.body);



      debugPrint("+++++++++++++++++++++++++++ OK Data++++++++++++++++++++++"+response.body);
      //return userModelFromJson(response.body);
    } else if (response.statusCode == 400) {
      throw const HttpException('getCustomerAddressData Error');
    } else {
      throw const HttpException('getCustomerAddressData Error');
    }
  }




}