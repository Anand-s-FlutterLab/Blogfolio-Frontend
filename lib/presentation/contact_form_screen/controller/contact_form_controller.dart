import 'package:flutter_frontend/core/app_export.dart';

class ContactFormController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  RxBool isFormSubmitting = false.obs;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    mobileController.dispose();
    messageController.dispose();
  }

  Future<void> addContactForm() async {
    try {
      isFormSubmitting.value = true;
      final CollectionReference productDoc =
          FirebaseFirestore.instance.collection(collectionContactForm);
      await productDoc.add(
        {
          "Candidate Name": nameController.text,
          "Mobile Number": mobileController.text,
          "Message": messageController.text,
          "User ID": userID.value,
          "User Name": userName.value
        },
      ).then((value) {
        customSnackBar("Success", "Form Has been submitted ", "green");
        nameController.clear();
        mobileController.clear();
        messageController.clear();
      }).catchError((error) {
        handleFirebaseError(error);
      });
    } catch (e) {
      customSnackBar("Error", "Something Went Wrong");
    } finally {
      isFormSubmitting.value = false;
    }
  }
}
