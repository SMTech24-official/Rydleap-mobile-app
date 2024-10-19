




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
  List<RidesAsCustomer>? ridesAsCustomer;
  List<dynamic>? riderReviewsAsCustomer;

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
    this.ridesAsCustomer,
    this.riderReviewsAsCustomer,
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
    ridesAsCustomer: List<RidesAsCustomer>.from(json["ridesAsCustomer"].map((x) => RidesAsCustomer.fromJson(x))),
    riderReviewsAsCustomer: List<dynamic>.from(json["riderReviewsAsCustomer"].map((x) => x)),
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
    "ridesAsCustomer": List<dynamic>.from(ridesAsCustomer!.map((x) => x.toJson())),
    "riderReviewsAsCustomer": List<dynamic>.from(riderReviewsAsCustomer!.map((x) => x)),
  };
}

class RidesAsCustomer {
  String? id;
  String? userId;
  dynamic riderId;
  double? pickupLat;
  double? pickupLng;
  double? destinationLat;
  double? destinationLng;
  dynamic date;
  dynamic time;
  String? packageId;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  RidesAsCustomer({
    this.id,
    this.userId,
    this.riderId,
    this.pickupLat,
    this.pickupLng,
    this.destinationLat,
    this.destinationLng,
    this.date,
    this.time,
    this.packageId,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory RidesAsCustomer.fromJson(Map<String, dynamic> json) => RidesAsCustomer(
    id: json["id"],
    userId: json["userId"],
    riderId: json["riderId"],
    pickupLat: json["pickupLat"].toDouble(),
    pickupLng: json["pickupLng"].toDouble(),
    destinationLat: json["destinationLat"].toDouble(),
    destinationLng: json["destinationLng"].toDouble(),
    date: json["date"],
    time: json["time"],
    packageId: json["packageId"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "riderId": riderId,
    "pickupLat": pickupLat,
    "pickupLng": pickupLng,
    "destinationLat": destinationLat,
    "destinationLng": destinationLng,
    "date": date,
    "time": time,
    "packageId": packageId,
    "status": status,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}
