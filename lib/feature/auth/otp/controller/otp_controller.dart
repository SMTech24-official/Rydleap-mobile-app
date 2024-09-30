import 'package:get/get.dart';
import 'package:rydleap/core/service/auth_service.dart';
import 'package:rydleap/feature/auth/otp/model/otp_response.dart';

class OtpController extends GetxController {
  var isLoading = false.obs;
  var otpCode = ''.obs;
  var otpResponse = OtpResponse(
          success: false,
          message: '',
          data: OtpData(
              body: '',
              from: '',
              to: '',
              status: '',
              sid: '',
              dateCreated: DateTime.now()))
      .obs;

  AuthService authService = AuthService();

  void sendOtp(String phoneNumber) async {
    try {
      isLoading(true);
      OtpResponse? response = await authService.sendOtp(phoneNumber);
      if (response != null) {
        otpResponse.value = response;
        print('Success: ${response.message}');
        // Get.to(OtpVerifiedScreen());
      }
    } catch (e, stacktrace) {
      print('Error: ${e.toString()}');
      print('Stacktrace: $stacktrace');
    } finally {
      isLoading(false);
    }
  }

  Future<bool> verifyOtp(String phoneNumber, String otpCode) async {
    try {
      print(
          "Verifying OTP: $otpCode for Phone Number: $phoneNumber"); // Debug line
      isLoading(true);
      OtpResponse? response = await authService.verifyOtp(phoneNumber, otpCode);
      if (response != null && response.success) {
        otpResponse.value = response; // Save the successful response
        print('OTP Verification Success: ${response.message}');
        return true; // Return true on success
      } else {
        throw Exception(response?.message ?? "Unknown error");
      }
    } catch (e) {
      print('Error during OTP verification: ${e.toString()}');
      return false; // Return false on failure
    } finally {
      isLoading(false);
    }
  }

  void setOtpCode(String code) {
    otpCode.value = code; // Set the OTP code
  }
}
