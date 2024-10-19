import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:http/http.dart' as http;

import '../model/contact_model.dart';

class ContactController extends GetxController{







  Rx<ContactModel> contactModel=ContactModel().obs;



  Future<void> getDriver(String driverID) async {

    print('into Packages');
    debugPrint("++++++++++++++++++Start++++++++++++++++++++++");


    final url = Uri.parse('https://rydleap-backend-eight.vercel.app/api/v1/users/single-rider/${driverID}');
    var response = await http.get(
      url,
    );

    // log('log me', name: response.body);

    debugPrint("+++++++++++status code....."+response.statusCode.toString());


    debugPrint("+++++++++++++++++++++++++++Driver Data++++++++++++++++++++++"+response.body);


    if (response.statusCode == 200) {

      contactModel.value= contactModelFromJson(response.body);



      debugPrint("+++++++++++++++++++++++++++ OK Data++++++++++++++++++++++"+response.body);
      //return userModelFromJson(response.body);
    } else if (response.statusCode == 400) {
      throw const HttpException('getCustomerAddressData Error');
    } else {
      throw const HttpException('getCustomerAddressData Error');
    }
  }




}