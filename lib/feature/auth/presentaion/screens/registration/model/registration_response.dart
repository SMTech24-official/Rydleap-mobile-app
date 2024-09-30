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
      data: RegistrationData.fromJson(json['data']), // Assume data is not null based on the structure you provided
    );
  }
}

class RegistrationData {
  final String id;
  final String name;
  final String email;
  final String? userName; // Nullable field
  final DateTime createdAt;
  final DateTime updatedAt;

  RegistrationData({
    required this.id,
    required this.name,
    required this.email,
    this.userName, // Nullable
    required this.createdAt,
    required this.updatedAt,
  });

  factory RegistrationData.fromJson(Map<String, dynamic> json) {
    return RegistrationData(
      id: json['id'] ?? '', // Default to empty string if null
      name: json['name'] ?? '', // Default to empty string if null
      email: json['email'] ?? '', // Default to empty string if null
      userName: json['userName'], // Nullable
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()), // Default to now if null
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()), // Default to now if null
    );
  }
}
class RegistrationRequest {
  final String name;
  final String email;
  final String phoneNumber;
  final String password;

  RegistrationRequest({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
    };
  }
}

