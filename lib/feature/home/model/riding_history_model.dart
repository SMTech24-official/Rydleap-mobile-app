


// To parse this JSON data, do
//
//     final ridingHistoryModel = ridingHistoryModelFromJson(jsonString);

import 'dart:convert';

RidingHistoryModel ridingHistoryModelFromJson(String str) => RidingHistoryModel.fromJson(json.decode(str));

String ridingHistoryModelToJson(RidingHistoryModel data) => json.encode(data.toJson());

class RidingHistoryModel {
  bool? success;
  String? message;
  List<Datum>? data;

  RidingHistoryModel({
    this.success,
    this.message,
    this.data,
  });

  factory RidingHistoryModel.fromJson(Map<String, dynamic> json) => RidingHistoryModel(
    success: json["success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? id;
  String? pickupLocation;
  String? dropoffLocation;
  String? fare;
  dynamic ratings;
  String? rideStatus;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? userId;
  User? user;

  Datum({
    this.id,
    this.pickupLocation,
    this.dropoffLocation,
    this.fare,
    this.ratings,
    this.rideStatus,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.user,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    pickupLocation: json["pickupLocation"],
    dropoffLocation: json["dropoffLocation"],
    fare: json["fare"],
    ratings: json["ratings"],
    rideStatus: json["rideStatus"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    userId: json["userId"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "pickupLocation": pickupLocation,
    "dropoffLocation": dropoffLocation,
    "fare": fare,
    "ratings": ratings,
    "rideStatus": rideStatus,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "userId": userId,
    "user": user?.toJson(),
  };
}

class User {
  String? id;
  String? email;
  String? phoneNumber;
  String? role;
  String? status;

  User({
    this.id,
    this.email,
    this.phoneNumber,
    this.role,
    this.status,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    role: json["role"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "phoneNumber": phoneNumber,
    "role": role,
    "status": status,
  };
}
