



// To parse this JSON data, do
//
//     final ridingRequestModel = ridingRequestModelFromJson(jsonString);

import 'dart:convert';

RidingRequestModel ridingRequestModelFromJson(String str) => RidingRequestModel.fromJson(json.decode(str));

String ridingRequestModelToJson(RidingRequestModel data) => json.encode(data.toJson());

class RidingRequestModel {
  bool? success;
  String? message;
  Data? data;

  RidingRequestModel({
    this.success,
    this.message,
    this.data,
  });

  factory RidingRequestModel.fromJson(Map<String, dynamic> json) => RidingRequestModel(
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
  Ride? ride;
  AssignedRider? assignedRider;

  Data({
    this.ride,
    this.assignedRider,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    ride: Ride.fromJson(json["ride"]),
    assignedRider: AssignedRider.fromJson(json["assignedRider"]),
  );

  Map<String, dynamic> toJson() => {
    "ride": ride?.toJson(),
    "assignedRider": assignedRider?.toJson(),
  };
}

class AssignedRider {
  String? id;
  String? fullName;
  dynamic profileImage;
  String? email;
  dynamic phoneNumber;
  bool? isPhoenVerified;
  dynamic password;
  dynamic fcpmToken;
  String? role;
  String? status;
  dynamic isOnline;
  bool? isDeleted;
  bool? isAvailable;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<dynamic>? riderVehicleInfo;
  List<Location>? locations;

  AssignedRider({
    this.id,
    this.fullName,
    this.profileImage,
    this.email,
    this.phoneNumber,
    this.isPhoenVerified,
    this.password,
    this.fcpmToken,
    this.role,
    this.status,
    this.isOnline,
    this.isDeleted,
    this.isAvailable,
    this.createdAt,
    this.updatedAt,
    this.riderVehicleInfo,
    this.locations,
  });

  factory AssignedRider.fromJson(Map<String, dynamic> json) => AssignedRider(
    id: json["id"],
    fullName: json["fullName"],
    profileImage: json["profileImage"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    isPhoenVerified: json["isPhoenVerified"],
    password: json["password"],
    fcpmToken: json["fcpmToken"],
    role: json["role"],
    status: json["status"],
    isOnline: json["isOnline"],
    isDeleted: json["isDeleted"],
    isAvailable: json["isAvailable"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    riderVehicleInfo: List<dynamic>.from(json["riderVehicleInfo"].map((x) => x)),
    locations: List<Location>.from(json["locations"].map((x) => Location.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullName": fullName,
    "profileImage": profileImage,
    "email": email,
    "phoneNumber": phoneNumber,
    "isPhoenVerified": isPhoenVerified,
    "password": password,
    "fcpmToken": fcpmToken,
    "role": role,
    "status": status,
    "isOnline": isOnline,
    "isDeleted": isDeleted,
    "isAvailable": isAvailable,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "riderVehicleInfo": List<dynamic>.from(riderVehicleInfo!.map((x) => x)),
    "locations": List<dynamic>.from(locations!.map((x) => x.toJson())),
  };
}

class Location {
  String? id;
  String? userId;
  double? locationLat;
  double? locationLng;
  DateTime? createdAt;
  DateTime? updatedAt;

  Location({
    this.id,
    this.userId,
    this.locationLat,
    this.locationLng,
    this.createdAt,
    this.updatedAt,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    id: json["id"],
    userId: json["userId"],
    locationLat: json["locationLat"].toDouble(),
    locationLng: json["locationLng"].toDouble(),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "locationLat": locationLat,
    "locationLng": locationLng,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class Ride {
  String? id;
  String? userId;
  String? riderId;
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

  Ride({
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

  factory Ride.fromJson(Map<String, dynamic> json) => Ride(
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
