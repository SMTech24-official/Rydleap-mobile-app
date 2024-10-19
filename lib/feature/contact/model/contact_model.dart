// To parse this JSON data, do
//
//     final contactModel = contactModelFromJson(jsonString);

import 'dart:convert';

ContactModel contactModelFromJson(String str) => ContactModel.fromJson(json.decode(str));

String contactModelToJson(ContactModel data) => json.encode(data.toJson());

class ContactModel {
  bool? success;
  String? message;
  Data? data;

  ContactModel({
    this.success,
    this.message,
    this.data,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
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
  String? fullName;
  dynamic profileImage;
  String? email;
  dynamic phoneNumber;
  bool? isPhoenVerified;
  dynamic password;
  String? role;
  String? status;
  dynamic isOnline;
  bool? isDeleted;
  bool? isAvailable;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<dynamic>? riderVehicleInfo;
  List<dynamic>? riderReviewsAsRider;
  List<dynamic>? ridesAsRider;

  Data({
    this.id,
    this.fullName,
    this.profileImage,
    this.email,
    this.phoneNumber,
    this.isPhoenVerified,
    this.password,
    this.role,
    this.status,
    this.isOnline,
    this.isDeleted,
    this.isAvailable,
    this.createdAt,
    this.updatedAt,
    this.riderVehicleInfo,
    this.riderReviewsAsRider,
    this.ridesAsRider,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    fullName: json["fullName"],
    profileImage: json["profileImage"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    isPhoenVerified: json["isPhoenVerified"],
    password: json["password"],
    role: json["role"],
    status: json["status"],
    isOnline: json["isOnline"],
    isDeleted: json["isDeleted"],
    isAvailable: json["isAvailable"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    riderVehicleInfo: List<dynamic>.from(json["riderVehicleInfo"].map((x) => x)),
    riderReviewsAsRider: List<dynamic>.from(json["riderReviewsAsRider"].map((x) => x)),
    ridesAsRider: List<dynamic>.from(json["ridesAsRider"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullName": fullName,
    "profileImage": profileImage,
    "email": email,
    "phoneNumber": phoneNumber,
    "isPhoenVerified": isPhoenVerified,
    "password": password,
    "role": role,
    "status": status,
    "isOnline": isOnline,
    "isDeleted": isDeleted,
    "isAvailable": isAvailable,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "riderVehicleInfo": List<dynamic>.from(riderVehicleInfo!.map((x) => x)),
    "riderReviewsAsRider": List<dynamic>.from(riderReviewsAsRider!.map((x) => x)),
    "ridesAsRider": List<dynamic>.from(ridesAsRider!.map((x) => x)),
  };
}
