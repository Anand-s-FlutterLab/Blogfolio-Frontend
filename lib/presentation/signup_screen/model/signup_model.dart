import 'package:flutter_frontend/core/app_export.dart';

class SignUpModel {
  String name;
  String emailAddress;
  String mobile;
  String profileURL;

  SignUpModel({
    required this.name,
    required this.emailAddress,
    required this.mobile,
    String? profileURL,
  }) : profileURL = profileURL ?? defaultProfileImage;

  Map<String, dynamic> toJson() {
    return {
      "Name": name,
      "Email Address": emailAddress,
      "Mobile": mobile,
      "Profile URL": profileURL,
    };
  }
}
