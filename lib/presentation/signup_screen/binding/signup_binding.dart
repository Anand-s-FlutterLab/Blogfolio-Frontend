import 'package:get/get.dart';
import 'package:flutter_frontend/presentation/signup_screen/controller/signup_controller.dart';

class SignupBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupController());
  }
}
