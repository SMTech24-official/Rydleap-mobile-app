class RegistrationResponse {
  final bool success;
  final String message;
  final RegistrationData data;

  RegistrationResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) {
    return RegistrationResponse(
      success: json['success'] ?? false, // Default to false if null
      message: json['message'] ?? '', // Default to empty string if null
      data: json['data'] != null
          ? RegistrationData.fromJson(json['data'])
          : RegistrationData.empty(), // Handle null data
    );
  }
}

class RegistrationData {
  final String id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String password; // Storing passwords in plaintext is not recommended
  final String role;
  final String status;
  final bool isDeleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  RegistrationData({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.role,
    required this.status,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory method for creating an instance from JSON
  factory RegistrationData.fromJson(Map<String, dynamic> json) {
    return RegistrationData(
      id: json['id'] ?? '',
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      password:
          json['password'] ?? '', // Consider not storing plaintext passwords
      role: json['role'] ?? '',
      status: json['status'] ?? '',
      isDeleted: json['isDeleted'] ?? false,
      createdAt:
          DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt:
          DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  // A named constructor for creating an empty instance
  factory RegistrationData.empty() {
    return RegistrationData(
      id: '',
      fullName: '',
      email: '',
      phoneNumber: '',
      password: '',
      role: '',
      status: '',
      isDeleted: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }
}

class RegistrationRequest {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String password;
  final String role;

  RegistrationRequest({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.role,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'role': role,
    };
  }
}
