



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ContactSupportController extends GetxController{


  Future<void> emailSend(

      String issue,
      String subject,
      String description,

      ) async {
    var userData = {};
    userData['issue'] = issue;
    userData['subject'] = subject;
    userData['description'] = description;


    // final url = Uri.parse(BASE_URL + 'send-money');

    final url = Uri.parse('https://rydleaps.vercel.app/api/v1/contact/send-email/66fb7a01e82f7ed39ef06ca4');




    var response = await http.post(
      url, body: userData,
        );


    debugPrint("++++++++++++++++++++++++++++++++" + response.body.toString());

    debugPrint("+++++++++++++++++++++++++++++++" + response.statusCode.toString());


    // if (response.statusCode == 200) {
    //   var jsonResponse = json.decode(response.body);
    //
    //   try {
    //     if (jsonResponse['status'] == 200) {
    //       debugPrint("ressssssssssssssssssssssssssss11111111111" + jsonResponse.toString());
    //       return true;
    //     } else {
    //       showSnackBar("Caution",jsonResponse["message"],Colors.orangeAccent,SnackPosition.BOTTOM);
    //       return false;
    //     }
    //   } catch (e) {
    //     debugPrint(e.toString());
    //   }
    // } else {
    //   var jsonResponse = json.decode(response.body);
    //   showSnackBar("Caution",jsonResponse["message"],Colors.orangeAccent,SnackPosition.BOTTOM);
    //   return false;
    // }
  }




}
