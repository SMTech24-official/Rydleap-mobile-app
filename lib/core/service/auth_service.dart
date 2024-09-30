import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rydleap/core/api_url.dart';
import 'package:rydleap/core/share_pref/share_pref.dart';
import 'package:rydleap/feature/auth/domain/model/login_model.dart';
import 'package:rydleap/feature/auth/login/model/login_model.dart';
import 'package:rydleap/feature/auth/otp/model/otp_response.dart';
import 'package:rydleap/feature/auth/presentaion/screens/registration/model/registration_response.dart';
import 'package:rydleap/feature/auth/presentaion/screens/registration/register_screen.dart';

class AuthService {

  bool isLoading=false;


  Future<OtpResponse?> sendOtp(String phoneNumber) async {
    // final url = Uri.parse('https://rydleaps.vercel.app/api/v1/otp/send-otp');
    final url = Uri.parse(ApiUrl.otpUrl);
    try {
      // Adjust the key name if necessary
      final bodyData = json.encode({
        'phoneNumber': phoneNumber, // Change key if required
      });

      print('Sending request with body: $bodyData');

      // Make the POST request
      final response = await http.post(
        url,
        body: bodyData,
        headers: {
          "Content-Type": "application/json",
        },
      );

      // Log full response details
      print('Status code: ${response.statusCode}');
      print('Headers: ${response.headers}');
      print('Response body: ${response.body}');

      // Check if the request was successful
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print("Successfully sent OTP");

        return OtpResponse.fromJson(jsonResponse);
      } else {
        print('Error response: ${response.body}');
        throw Exception(
            'Failed to send OTP, status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception caught: ${e.toString()}');
      rethrow;
    }
  }

  Future<OtpResponse?> verifyOtp(String phoneNumber, String otpCode) async {
    final url = Uri.parse(ApiUrl.verifyOtpUrl);
    try {
      // Construct the request body
      final bodyData = json.encode({
        'phoneNumber': phoneNumber, // Adjust key if necessary
        'otp': otpCode, // Adjust key if necessary
      });

      print('Sending OTP verification request with body: $bodyData');

      // Make the POST request
      final response = await http.post(
        url,
        body: bodyData,
        headers: {
          "Content-Type": "application/json",
        },
      );

      // Log full response details
      print('Status code: ${response.statusCode}');
      print('Headers: ${response.headers}');
      print('Response body: ${response.body}');

      // Check if the request was successful
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print("OTP successfully verified");

        return OtpResponse.fromJson(jsonResponse);
      } else {
        print('Error response: ${response.body}');
        throw Exception(
            'Failed to verify OTP, status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception caught: ${e.toString()}');
      rethrow;
    }
  }

  Future<RegistrationResponse?> registerUser(
      RegistrationRequest request) async {
    final url = Uri.parse(
        ApiUrl.userRegistrationUrl); // Replace with your registration endpoint
    try {
      final bodyData = json.encode(request.toJson());

      print('Sending registration request with body: $bodyData');

      final response = await http.post(
        url,
        body: bodyData,
        headers: {
          "Content-Type": "application/json",
        },
      );

      print('Status code: ${response.statusCode}');
      print('Headers: ${response.headers}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print("Registration successful");

        return RegistrationResponse.fromJson(jsonResponse);
      } else {
        print('Error response: ${response.body}');
        throw Exception(
            'Failed to register user, status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception caught: ${e.toString()}');
      rethrow;
    }
  }

  Future<RegistrationResponse?> registerDriver(
      RegistrationRequest request) async {
    final url = Uri.parse(
        ApiUrl.driverRegistrationUrl); // Replace with your registration endpoint
    try {
      final bodyData = json.encode(request.toJson());

      print('Sending registration request with body: $bodyData');

      final response = await http.post(
        url,
        body: bodyData,
        headers: {
          "Content-Type": "application/json",
        },
      );

      print('Status code: ${response.statusCode}');
      print('Headers: ${response.headers}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print("Registration successful");

        return RegistrationResponse.fromJson(jsonResponse);
      } else {
        print('Error response: ${response.body}');
        throw Exception(
            'Failed to register user, status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception caught: ${e.toString()}');
      rethrow;
    }
  }


 Future<LoginModel?> login(String email, String password) async {
  // print('into the login fun');
    try {
      // print('into try fun');
      final response = await http.post(
        Uri.parse("https://rydleaps.vercel.app/api/v1/auth/login"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );
// print(response.body);
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
      return LoginModel.fromJson(jsonResponse);
      } else {
        // Log the error response
        print('Login failed: ${response.statusCode} - ${response.body}');
        return null; // Return null for unsuccessful login
      }
    } catch (e) {
      // Handle error and print to console
      print('Login Exception: ${e.toString()}');
      return null; // Return null for error handling
    }
  }
}
