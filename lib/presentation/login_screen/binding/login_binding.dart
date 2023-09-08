import 'package:get/get.dart';
import 'package:flutter_frontend/presentation/login_screen/controller/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
