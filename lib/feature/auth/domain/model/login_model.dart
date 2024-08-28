
import 'package:rydleap/feature/auth/domain/model/user_model.dart';

class LoginModel {
  bool? success;
  int? statusCode;
  String? message;
  String? token;
  UserModel? userModel;

  LoginModel({this.success, this.statusCode, this.message, this.token, this.userModel});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    token = json['data']['token'];
    userModel = json['data']['user'] != null ? UserModel.fromJson(json['data']['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['statusCode'] = statusCode;
    data['message'] = message;
    data['data'] = {
      'token': token,
      'user': userModel != null ? userModel!.toJson() : null,
    };
    return data;
  }
}
