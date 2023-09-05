import 'package:flutter_frontend/core/app_export.dart';

class PortfolioController extends GetxController {
  TextEditingController mobileController = TextEditingController();

  RxBool isEditProfilePressed = false.obs;
  RxList<TextEditingController> projectControllers =
      <TextEditingController>[].obs;
  RxList<TextEditingController> skillControllers =
      <TextEditingController>[].obs;
  RxList<TextEditingController> achievementControllers =
      <TextEditingController>[].obs;

  void addProjectController() {
    TextEditingController projectController = TextEditingController();
    projectControllers.add(projectController);
  }

  void addSkillController() {
    TextEditingController skillController = TextEditingController();
    skillControllers.add(skillController);
  }

  void addAchievementController() {
    TextEditingController achievementController = TextEditingController();
    achievementControllers.add(achievementController);
  }
}
