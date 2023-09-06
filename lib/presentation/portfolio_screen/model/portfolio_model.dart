import 'dart:convert';

PortfolioModel portfolioModelFromJson(String str) => PortfolioModel.fromJson(json.decode(str));

String portfolioModelToJson(PortfolioModel data) => json.encode(data.toJson());

class PortfolioModel {
  String name;
  String emailAddress;
  String mobile;
  String profileImage;
  List<String> achievements;
  List<String> projects;
  List<String> skills;

  PortfolioModel({
    required this.name,
    required this.emailAddress,
    required this.mobile,
    required this.profileImage,
    required this.achievements,
    required this.projects,
    required this.skills,
  });

  factory PortfolioModel.fromJson(Map<String, dynamic> json) => PortfolioModel(
    name: json["name"],
    emailAddress: json["emailAddress"],
    mobile: json["mobile"],
    profileImage: json["profileImage"],
    achievements: List<String>.from(json["achievements"].map((x) => x)),
    projects: List<String>.from(json["projects"].map((x) => x)),
    skills: List<String>.from(json["skills"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "emailAddress": emailAddress,
    "mobile": mobile,
    "profileImage": profileImage,
    "achievements": List<dynamic>.from(achievements.map((x) => x)),
    "projects": List<dynamic>.from(projects.map((x) => x)),
    "skills": List<dynamic>.from(skills.map((x) => x)),
  };
}
