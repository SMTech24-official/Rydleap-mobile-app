// To parse this JSON data, do
//
//     final riderModel = riderModelFromJson(jsonString);

import 'dart:convert';

RiderModel riderModelFromJson(String str) => RiderModel.fromJson(json.decode(str));

String riderModelToJson(RiderModel data) => json.encode(data.toJson());

class RiderModel {
  bool? success;
  String? message;
  Data? data;

  RiderModel({
    this.success,
    this.message,
    this.data,
  });

  factory RiderModel.fromJson(Map<String, dynamic> json) => RiderModel(
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
  String? profileImage;
  String? email;
  String? phoneNumber;
  bool? isPhoenVerified;
  String? password;
  String? fcpmToken;
  String? role;
  String? status;
  dynamic isOnline;
  bool? isDeleted;
  dynamic isAvailable;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<RiderVehicleInfo>? riderVehicleInfo;
  List<RiderReviewsAsRider>? riderReviewsAsRider;
  List<dynamic>? ridesAsRider;

  Data({
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
    fcpmToken: json["fcpmToken"],
    role: json["role"],
    status: json["status"],
    isOnline: json["isOnline"],
    isDeleted: json["isDeleted"],
    isAvailable: json["isAvailable"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    riderVehicleInfo: List<RiderVehicleInfo>.from(json["riderVehicleInfo"].map((x) => RiderVehicleInfo.fromJson(x))),
    riderReviewsAsRider: List<RiderReviewsAsRider>.from(json["riderReviewsAsRider"].map((x) => RiderReviewsAsRider.fromJson(x))),
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
    "fcpmToken": fcpmToken,
    "role": role,
    "status": status,
    "isOnline": isOnline,
    "isDeleted": isDeleted,
    "isAvailable": isAvailable,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "riderVehicleInfo": List<dynamic>.from(riderVehicleInfo!.map((x) => x.toJson())),
    "riderReviewsAsRider": List<dynamic>.from(riderReviewsAsRider!.map((x) => x.toJson())),
    "ridesAsRider": List<dynamic>.from(ridesAsRider!.map((x) => x)),
  };
}

class RiderReviewsAsRider {
  String? id;
  String? rideId;
  String? riderId;
  String? customerId;
  int? rating;
  String? comment;
  DateTime? createdAt;
  DateTime? updatedAt;

  RiderReviewsAsRider({
    this.id,
    this.rideId,
    this.riderId,
    this.customerId,
    this.rating,
    this.comment,
    this.createdAt,
    this.updatedAt,
  });

  factory RiderReviewsAsRider.fromJson(Map<String, dynamic> json) => RiderReviewsAsRider(
    id: json["id"],
    rideId: json["rideId"],
    riderId: json["riderId"],
    customerId: json["customerId"],
    rating: json["rating"],
    comment: json["comment"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "rideId": rideId,
    "riderId": riderId,
    "customerId": customerId,
    "rating": rating,
    "comment": comment,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class RiderVehicleInfo {
  String? id;
  String? vehicleMake;
  String? vehicleModel;
  String? vehicleYear;
  String? vehicleColor;
  String? vehicleLicensePlateNumber;
  List<Image>? vehicleRegistrationImage;
  List<Image>? vehicleInsuranceImage;
  List<Image>? drivingLicenceImage;
  String? userId;
  DateTime? createdAt;
  DateTime? updatedAt;

  RiderVehicleInfo({
    this.id,
    this.vehicleMake,
    this.vehicleModel,
    this.vehicleYear,
    this.vehicleColor,
    this.vehicleLicensePlateNumber,
    this.vehicleRegistrationImage,
    this.vehicleInsuranceImage,
    this.drivingLicenceImage,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory RiderVehicleInfo.fromJson(Map<String, dynamic> json) => RiderVehicleInfo(
    id: json["id"],
    vehicleMake: json["vehicleMake"],
    vehicleModel: json["vehicleModel"],
    vehicleYear: json["vehicleYear"],
    vehicleColor: json["vehicleColor"],
    vehicleLicensePlateNumber: json["vehicleLicensePlateNumber"],
    vehicleRegistrationImage: List<Image>.from(json["vehicleRegistrationImage"].map((x) => Image.fromJson(x))),
    vehicleInsuranceImage: List<Image>.from(json["vehicleInsuranceImage"].map((x) => Image.fromJson(x))),
    drivingLicenceImage: List<Image>.from(json["drivingLicenceImage"].map((x) => Image.fromJson(x))),
    userId: json["userId"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vehicleMake": vehicleMake,
    "vehicleModel": vehicleModel,
    "vehicleYear": vehicleYear,
    "vehicleColor": vehicleColor,
    "vehicleLicensePlateNumber": vehicleLicensePlateNumber,
    "vehicleRegistrationImage": List<dynamic>.from(vehicleRegistrationImage!.map((x) => x.toJson())),
    "vehicleInsuranceImage": List<dynamic>.from(vehicleInsuranceImage!.map((x) => x.toJson())),
    "drivingLicenceImage": List<dynamic>.from(drivingLicenceImage!.map((x) => x.toJson())),
    "userId": userId,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class Image {
  String? url;

  Image({
    this.url,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
  };
}
