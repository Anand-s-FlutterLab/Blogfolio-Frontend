import 'package:flutter_frontend/core/app_export.dart';

class PortfolioController extends GetxController {
  TextEditingController mobileController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  RxBool isEditProfilePressed = false.obs;
  RxMap<String, RxList<String>> portfolio = <String, RxList<String>>{
    "project": <String>[].obs,
    "skill": <String>[].obs,
    "achievement": <String>[].obs,
  }.obs;

  void addData(String key, String data) {
    if (portfolio.containsKey(key)) {
      portfolio[key]?.add(data);
    } else {
      portfolio[key] = [data].obs;
    }
  }
}
