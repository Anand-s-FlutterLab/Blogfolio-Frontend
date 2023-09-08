import 'dart:convert';

PortfolioModel portfolioModelFromJson(String str) =>
    PortfolioModel.fromJson(json.decode(str));

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

  factory PortfolioModel.fromJson(Map<String, dynamic> json) {
    return PortfolioModel(
      name: json["Name"],
      emailAddress: json["Email Address"],
      mobile: json["Mobile"],
      profileImage: json["Profile URL"],
      achievements: List<String>.from(json["Achievements"].map((x) => x)),
      projects: List<String>.from(json["Projects"].map((x) => x)),
      skills: List<String>.from(json["Skills"].map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Email Address": emailAddress,
        "Mobile": mobile,
        "Profile URL": profileImage,
        "Achievements": List<dynamic>.from(achievements.map((x) => x)),
        "Projects": List<dynamic>.from(projects.map((x) => x)),
        "Skills": List<dynamic>.from(skills.map((x) => x)),
      };
}
