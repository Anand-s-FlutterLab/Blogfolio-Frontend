// Import the necessary packages and classes.
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_frontend/core/app_export.dart';

// Create a controller class for initial data loading.
class InitialDataLoad extends GetxController {
  @override
  void onInit() async {
    super.onInit();

    // Initialize the app's data when the controller is initialized.
    await initializeApp();
  }

  // Function to initialize the app's data.
  Future<void> initializeApp() async {
    // Set the userID from the current Firebase user.
    userID.value = FirebaseAuth.instance.currentUser!.uid;

    // Read and set user data from local storage (if available).
    userName.value = await readStorage(storageUserName) ?? "";
    email.value = await readStorage(storageEmail) ?? "";
    mobile.value = await readStorage(storageMobile) ?? "";
    userProfileURL.value = await readStorage(storageUserProfileURL) ?? "";
  }
}
