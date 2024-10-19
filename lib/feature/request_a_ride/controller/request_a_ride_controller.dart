import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rydleap/feature/request_a_ride/presentation/request_a_ride.dart';

import '../../contact/presentation/contact.dart';
import '../model/riding_request_model.dart';

class RequestARideController extends GetxController {

  Rx<RidingRequestModel> ridingRequestModel=RidingRequestModel().obs;




  String accessToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3MGM5NTkyYTJkZjcxZDkwOGJhN2MzYiIsImVtYWlsIjoic2Fnb3JAZ21haWwuY29tIiwicm9sZSI6IlVTRVIiLCJpYXQiOjE3MjkyMzEwMjcsImV4cCI6MTczMTgyMzAyN30.t6hXXeAzxkqG4bQqRZMvwZ1ZIK75YVpzMFk40F7anLY';

  Future<void> requestRide(double pickupLat, double pickupLng,
      double destinationLat, double destinationLng, String packageId) async {
    Map<String, String> headers = {
      "Authorization": "$accessToken",
      "Content-Type": "application/json",
      //"Bearer ${SharePref.getUserAccessToken()}",
    };
    print(pickupLat.runtimeType);

    Map<String, dynamic> userData = {
      'pickupLat': pickupLat,
      'pickupLng': pickupLng,
      'destinationLat': destinationLat,
      'destinationLng': destinationLng,
      'packageId': packageId,
    };
    print('this is user data - ${userData}');
    debugPrint('****************${userData}*********************************');

    final url = Uri.parse(
        'https://rydleap-backend-eight.vercel.app/api/v1/ride/request');
    var response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(userData),
    );

    // log('log me', name: response.body);

    debugPrint("+++++++++++status code....." + response.statusCode.toString());

    // debugPrint("+++++++++++++++++++++++++++Ride Request++++++++++++++++++++++" +
    //     response.body);

    if (response.statusCode == 200) {

      ridingRequestModel.value= ridingRequestModelFromJson(response.body);


      if(jsonDecode(response.body)['success']==true){

        Get.to(Contact(ridingRequestModel: ridingRequestModel.value,));


        // Navigator.push(
        //     context, MaterialPageRoute(builder: (_) => ));
      }


      debugPrint("+++++++++++++++++++++++++++Riding request 2++++++++++++++++++++++"+jsonDecode(response.body)['success'].toString());


      //return userModelFromJson(response.body);
    } else if (response.statusCode == 400) {
      throw const HttpException('getCustomerAddressData Error');
    } else {
      throw const HttpException('getCustomerAddressData Error');
    }
  }
}
