import 'package:flutter_frontend/core/app_export.dart';
import 'package:flutter_frontend/presentation/user_profile_screen/model/user_profile_model.dart';

class UserProfileController extends GetxController {
  late UserProfileModel userProfileModel;
  late Portfolio portfolio;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    addData();
  }

  void addData() {
    portfolio = Portfolio.fromJson(
      {
        "projects": [
          {
            "title": "Project 2",
            "description": "Description 3",
            "technology": ["Tech 3", "Tech 4"],
            "date": "20-05-2021"
          },
          {
            "title": "Project 3",
            "description": "Description 2",
            "technology": ["Tech 2"],
            "date": "15-01-2022"
          },
          {
            "title": "Project 2",
            "description": "Description 3",
            "technology": ["Tech 1"],
            "date": "08-10-2020"
          }
        ],
        "skills": [
          {
            "skillname": "Skill 4",
            "skill_level": 2
          },
          {
            "skillname": "Skill 2",
            "skill_level": 6
          },
          {
            "skillname": "Skill 1",
            "skill_level": 7
          },
          {
            "skillname": "Skill 4",
            "skill_level": 5
          },
          {
            "skillname": "Skill 2",
            "skill_level": 9
          },
          {
            "skillname": "Skill 1",
            "skill_level": 3
          },
          {
            "skillname": "Skill 4",
            "skill_level": 8
          },
          {
            "skillname": "Skill 3",
            "skill_level": 4
          },
          {
            "skillname": "Skill 5",
            "skill_level": 10
          },
          {
            "skillname": "Skill 3",
            "skill_level": 1
          }
        ],
        "achievements": [
          {
            "title": "Achievement 2",
            "university_name": "University B",
            "date": "10-03-2022"
          },
          {
            "title": "Achievement 3",
            "university_name": "University C",
            "date": "05-07-2021"
          },
          {
            "title": "Achievement 2",
            "university_name": "University A",
            "date": "15-11-2020"
          },
          {
            "title": "Achievement 3",
            "university_name": "University B",
            "date": "05-07-2021"
          },
          {
            "title": "Achievement 1",
            "university_name": "University C",
            "date": "10-03-2022"
          },
          {
            "title": "Achievement 2",
            "university_name": "University A",
            "date": "15-11-2020"
          },
          {
            "title": "Achievement 1",
            "university_name": "University C",
            "date": "05-07-2021"
          },
          {
            "title": "Achievement 3",
            "university_name": "University B",
            "date": "10-03-2022"
          },
          {
            "title": "Achievement 1",
            "university_name": "University A",
            "date": "15-11-2020"
          },
          {
            "title": "Achievement 1",
            "university_name": "University A",
            "date": "10-03-2022"
          }
        ]
      },
    );
    userProfileModel = UserProfileModel(
      name: "Anand Patel",
      emailAddress: "anand@gmail.com",
      mobile: "7069144776",
    );
  }
}
