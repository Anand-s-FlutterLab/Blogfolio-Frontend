import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_frontend/core/app_export.dart';

class InitialDataLoad extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkUserConfiguration();
  }

  Future<void> checkUserConfiguration() async {
    if (FirebaseAuth.instance.currentUser != null) {
      Get.offNamed(AppRoutes.homeScreen);
    } else {
      Get.offNamed(AppRoutes.loginScreen);
    }
  }
}
