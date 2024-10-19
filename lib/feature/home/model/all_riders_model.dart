


// To parse this JSON data, do
//
//     final allRidersModel = allRidersModelFromJson(jsonString);

import 'dart:convert';

AllRidersModel allRidersModelFromJson(String str) => AllRidersModel.fromJson(json.decode(str));

String allRidersModelToJson(AllRidersModel data) => json.encode(data.toJson());

class AllRidersModel {
  bool? success;
  String? message;
  Data? data;

  AllRidersModel({
    this.success,
    this.message,
    this.data,
  });

  factory AllRidersModel.fromJson(Map<String, dynamic> json) => AllRidersModel(
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
  Meta? meta;
  List<Datum>? data;

  Data({
    this.meta,
    this.data,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    meta: Meta.fromJson(json["meta"]),
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meta": meta?.toJson(),
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? id;
  String? fullName;
  String? phoneNumber;
  String? email;
  String? role;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  Locations? locations;
  RiderVehicleInfo? riderVehicleInfo;
  RiderReviewsAsRider? riderReviewsAsRider;

  Datum({
    this.id,
    this.fullName,
    this.phoneNumber,
    this.email,
    this.role,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.locations,
    this.riderVehicleInfo,
    this.riderReviewsAsRider,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    fullName: json["fullName"],
    phoneNumber: json["phoneNumber"],
    email: json["email"],
    role: json["role"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    locations: Locations.fromJson(json["locations"]),
    riderVehicleInfo: RiderVehicleInfo.fromJson(json["riderVehicleInfo"]),
    riderReviewsAsRider: RiderReviewsAsRider.fromJson(json["riderReviewsAsRider"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullName": fullName,
    "phoneNumber": phoneNumber,
    "email": email,
    "role": role,
    "status": status,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "locations": locations?.toJson(),
    "riderVehicleInfo": riderVehicleInfo?.toJson(),
    "riderReviewsAsRider": riderReviewsAsRider?.toJson(),
  };
}

class Locations {
  String? id;
  String? userId;
  double? locationLat;
  double? locationLng;
  DateTime? createdAt;
  DateTime? updatedAt;

  Locations({
    this.id,
    this.userId,
    this.locationLat,
    this.locationLng,
    this.createdAt,
    this.updatedAt,
  });

  factory Locations.fromJson(Map<String, dynamic> json) => Locations(
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

class Meta {
  int? page;
  int? limit;
  int? total;

  Meta({
    this.page,
    this.limit,
    this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    page: json["page"],
    limit: json["limit"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "limit": limit,
    "total": total,
  };
}


