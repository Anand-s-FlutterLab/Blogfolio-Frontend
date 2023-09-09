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
      // Start form submission process
      isFormSubmitting.value = true;

      // Get a reference to the Firestore collection
      final CollectionReference productDoc =
      FirebaseFirestore.instance.collection(collectionContactForm);

      // Add the contact form data to Firestore
      await productDoc.add(
        {
          "Candidate Name": nameController.text,
          "Mobile Number": mobileController.text,
          "Message": messageController.text,
          "User ID": userID.value,
          "User Name": userName.value,
        },
      ).then((value) {
        // Form submission successful
        customSnackBar("Success", "Form Has been submitted ", "green");

        // Clear input fields
        nameController.clear();
        mobileController.clear();
        messageController.clear();
      }).catchError((error) {
        // Handle any errors that occur during submission
        handleFirebaseError(error);
      });
    } catch (e) {
      // Handle general errors
      customSnackBar("Error", "Something Went Wrong");
    } finally {
      // End the form submission process
      isFormSubmitting.value = false;
    }
  }
}
