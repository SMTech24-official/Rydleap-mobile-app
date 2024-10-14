import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  Map<String, String> headers = {
    "Authorization": "Bearer ",
  };

  Future<dynamic> ChangePassword(String userId, String receiver_user_id,
      String transaction_type, String transaction_amount) async {
    var userData = {};
    userData['receiver_user_id'] = receiver_user_id;
    userData['transaction_type'] = transaction_type;
    userData['transaction_amount'] = transaction_amount;

    // final url = Uri.parse(BASE_URL + 'send-money');

    final url =
        Uri.parse('https://rydleaps.vercel.app/api/v1/auth/change-password');

    debugPrint("user token" + userData.toString());

    // final url = Uri.parse('http://172.31.120.58:80/api/user-login');

    debugPrint("ressssssssssssssssssssssssssss" + url.toString());

    var response = await http.post(url, body: userData, headers: headers);

    debugPrint("ressssssssssssssssssssssssssss" + response.body.toString());

    debugPrint(
        "ressssssssssssssssssssssssssss" + response.statusCode.toString());

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
