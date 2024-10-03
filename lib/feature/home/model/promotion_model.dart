



// To parse this JSON data, do
//
//     final promotionModel = promotionModelFromJson(jsonString);

import 'dart:convert';

PromotionModel promotionModelFromJson(String str) => PromotionModel.fromJson(json.decode(str));

String promotionModelToJson(PromotionModel data) => json.encode(data.toJson());

class PromotionModel {
  bool? success;
  String? message;
  List<Datum>? data;

  PromotionModel({
    this.success,
    this.message,
    this.data,
  });

  factory PromotionModel.fromJson(Map<String, dynamic> json) => PromotionModel(
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
  String? title;
  String? subTitle;
  dynamic image;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.title,
    this.subTitle,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    subTitle: json["subTitle"],
    image: json["image"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "subTitle": subTitle,
    "image": image,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}
