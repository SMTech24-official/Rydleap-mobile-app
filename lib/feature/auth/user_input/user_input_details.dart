class UserInputDetails {
  String name;
  String email;
  String password;
  String confirmPassword;
  String phoneNumber; // Add phone number field

  UserInputDetails({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phoneNumber, // Update constructor
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'phoneNumber': phoneNumber, // Include phone number in JSON
    };
  }
}