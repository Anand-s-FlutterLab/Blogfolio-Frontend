// Import necessary packages
import 'package:get/get.dart';
import 'package:flutter_frontend/presentation/signup_screen/controller/signup_controller.dart';

// Create a class called SignupBindings that extends Bindings
class SignupBindings extends Bindings {
  @override
  void dependencies() {
    // Define the dependencies for this binding
    Get.lazyPut(() => SignupController()); // Lazily creates an instance of SignupController
  }
}
