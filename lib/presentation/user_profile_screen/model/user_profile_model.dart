// To parse this JSON data, do
//
//     final portfolio = portfolioFromJson(jsonString);

import 'dart:convert';
import 'package:flutter_frontend/core/app_export.dart';

// To parse this JSON data, do
//
//     final portfolio = portfolioFromJson(jsonString);

import 'dart:convert';

// To parse this JSON data, do
//
//     final portfolio = portfolioFromJson(jsonString);

import 'dart:convert';

Portfolio portfolioFromJson(String str) => Portfolio.fromJson(json.decode(str));

String portfolioToJson(Portfolio data) => json.encode(data.toJson());

class Portfolio {
  List<Project> projects;
  List<Skill> skills;
  List<Achievement> achievements;

  Portfolio({
    required this.projects,
    required this.skills,
    required this.achievements,
  });

  factory Portfolio.fromJson(Map<String, dynamic> json) => Portfolio(
    projects: List<Project>.from(json["projects"].map((x) => Project.fromJson(x))),
    skills: List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
    achievements: List<Achievement>.from(json["achievements"].map((x) => Achievement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "projects": List<dynamic>.from(projects.map((x) => x.toJson())),
    "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
    "achievements": List<dynamic>.from(achievements.map((x) => x.toJson())),
  };
}

class Achievement {
  Title title;
  UniversityName universityName;
  Date date;

  Achievement({
    required this.title,
    required this.universityName,
    required this.date,
  });

  factory Achievement.fromJson(Map<String, dynamic> json) => Achievement(
    title: titleValues.map[json["title"]]!,
    universityName: universityNameValues.map[json["university_name"]]!,
    date: dateValues.map[json["date"]]!,
  );

  Map<String, dynamic> toJson() => {
    "title": titleValues.reverse[title],
    "university_name": universityNameValues.reverse[universityName],
    "date": dateValues.reverse[date],
  };
}

enum Date {
  THE_05072021,
  THE_10032022,
  THE_15112020
}

final dateValues = EnumValues({
  "05-07-2021": Date.THE_05072021,
  "10-03-2022": Date.THE_10032022,
  "15-11-2020": Date.THE_15112020
});

enum Title {
  ACHIEVEMENT_1,
  ACHIEVEMENT_2,
  ACHIEVEMENT_3
}

final titleValues = EnumValues({
  "Achievement 1": Title.ACHIEVEMENT_1,
  "Achievement 2": Title.ACHIEVEMENT_2,
  "Achievement 3": Title.ACHIEVEMENT_3
});

enum UniversityName {
  UNIVERSITY_A,
  UNIVERSITY_B,
  UNIVERSITY_C
}

final universityNameValues = EnumValues({
  "University A": UniversityName.UNIVERSITY_A,
  "University B": UniversityName.UNIVERSITY_B,
  "University C": UniversityName.UNIVERSITY_C
});

class Project {
  String title;
  String description;
  List<String> technology;
  String date;

  Project({
    required this.title,
    required this.description,
    required this.technology,
    required this.date,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
    title: json["title"],
    description: json["description"],
    technology: List<String>.from(json["technology"].map((x) => x)),
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "technology": List<dynamic>.from(technology.map((x) => x)),
    "date": date,
  };
}

class Skill {
  String skillname;
  int skillLevel;

  Skill({
    required this.skillname,
    required this.skillLevel,
  });

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
    skillname: json["skillname"],
    skillLevel: json["skill_level"],
  );

  Map<String, dynamic> toJson() => {
    "skillname": skillname,
    "skill_level": skillLevel,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

class UserProfileModel {
  String name;
  String emailAddress;
  String mobile;
  String profileURL;

  UserProfileModel({
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
