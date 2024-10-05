class UserInputDetails {
  String fullName;
  String email;
  String password;
  String confirmPassword;
  String phoneNumber;
  String role; // Add phone number field

  UserInputDetails({
    required this.fullName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phoneNumber,
    required this.role
     // Update constructor
  });

  Map<String, dynamic> toJson() {
    return {
      'name': fullName,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'phoneNumber': phoneNumber, 
      'role': phoneNumber, 
    };
  }
}