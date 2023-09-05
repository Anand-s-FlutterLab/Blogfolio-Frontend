import 'package:flutter_frontend/presentation/blog_screen/controller/blog_controller.dart';
import 'package:get/get.dart';

class BlogBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BlogController());
  }
}
