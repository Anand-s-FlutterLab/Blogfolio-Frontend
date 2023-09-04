import 'package:flutter_frontend/core/app_export.dart';
import 'package:flutter_frontend/presentation/user_profile_screen/controller/user_profile_controller.dart';

class UserProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserProfileController());
  }
}
