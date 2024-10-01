class ProfileModel {
  bool? success;
  String? message;
  UserProfile? data;

  ProfileModel({this.success, this.message, this.data});

  // Deserialize JSON to ProfileModel
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? UserProfile.fromJson(json['data']) : null,
    );
  }

  // Serialize ProfileModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class UserProfile {
  String? id;
  String? email;
  String? role;
  String? status;
  String? phoneNumber;
  String? name;
  String? userName;
  String? profileImage;
  String? drivingLicenseImage;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserProfile({
    this.id,
    this.email,
    this.role,
    this.status,
    this.phoneNumber,
    this.name,
    this.userName,
    this.profileImage,
    this.drivingLicenseImage,
    this.createdAt,
    this.updatedAt,
  });

  // Deserialize JSON to UserProfile
  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'],
      email: json['email'],
      role: json['role'],
      status: json['status'],
      phoneNumber: json['phoneNumber'],
      name: json['name'],
      userName: json['userName'],
      profileImage: json['profileImage'],
      drivingLicenseImage: json['drivingLicenseImage'],
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
    );
  }

  // Serialize UserProfile to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'role': role,
      'status': status,
      'phoneNumber': phoneNumber,
      'name': name,
      'userName': userName,
      'profileImage': profileImage,
      'drivingLicenseImage': drivingLicenseImage,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
