import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String emailAddress;
  String mobile;
  String name;

  LoginModel({
    required this.emailAddress,
    required this.mobile,
    required this.name,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    emailAddress: json["Email Address"],
    mobile: json["Mobile"],
    name: json["Name"],
  );

  Map<String, dynamic> toJson() => {
    "Email Address": emailAddress,
    "Mobile": mobile,
    "Name": name,
  };
}
