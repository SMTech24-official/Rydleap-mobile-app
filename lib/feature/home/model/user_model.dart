


// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  bool? success;
  String? message;
  Data? data;

  UserModel({
    this.success,
    this.message,
    this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  String? id;
  String? email;
  String? phoneNumber;
  String? role;
  String? status;
  String? name;
  dynamic userName;
  dynamic profileImage;
  dynamic drivingLicenseImage;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.id,
    this.email,
    this.phoneNumber,
    this.role,
    this.status,
    this.name,
    this.userName,
    this.profileImage,
    this.drivingLicenseImage,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    role: json["role"],
    status: json["status"],
    name: json["name"],
    userName: json["userName"],
    profileImage: json["profileImage"],
    drivingLicenseImage: json["drivingLicenseImage"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "phoneNumber": phoneNumber,
    "role": role,
    "status": status,
    "name": name,
    "userName": userName,
    "profileImage": profileImage,
    "drivingLicenseImage": drivingLicenseImage,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}
