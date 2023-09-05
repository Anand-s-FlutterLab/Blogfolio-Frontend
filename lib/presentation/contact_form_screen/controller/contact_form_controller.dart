import 'package:flutter_frontend/core/app_export.dart';

class ContactFormController extends GetxController{
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  RxBool isFormSubmitting = false.obs;
}