class ApiUrl {
  static const baseUrl = "https://rydleap-backend-eight.vercel.app/api/v1";

  static const otpUrl = "$baseUrl/api/v1/otp/send-otp";
  static const verifyOtpUrl = "$baseUrl/api/v1/otp/verify-otp";
  static const userRegistrationUrl = "$baseUrl/api/v1/users/register";
  static const driverRegistrationUrl = "$baseUrl/api/v1/users/create-rider";
  static const loginUrl = "$baseUrl/api/v1/auth/login";
  static const updateToken = "$baseUrl/api/v1/auth/update-fcp/";
}
