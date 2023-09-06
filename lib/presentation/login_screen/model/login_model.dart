import 'dart:convert';

import 'package:flutter_frontend/core/utils/image_constant.dart';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String emailAddress;
  String mobile;
  String name;
  String profileURL;

  LoginModel({
    required this.emailAddress,
    required this.mobile,
    required this.name,
    String? profileURL,
  }) : profileURL = profileURL ?? defaultProfileImage;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    emailAddress: json["Email Address"],
    mobile: json["Mobile"],
    name: json["Name"],
  );

  Map<String, dynamic> toJson() => {
    "Email Address": emailAddress,
    "Mobile": mobile,
    "Name": name,
    "Profile URL": profileURL,
  };
}
