import 'package:flutter_frontend/core/app_export.dart';
import 'package:flutter_frontend/presentation/contact_form_screen/controller/contact_form_controller.dart';

class ContactFormBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactFormController());
  }
}
