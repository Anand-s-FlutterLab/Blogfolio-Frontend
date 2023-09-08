// Import the necessary packages.
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_frontend/core/app_export.dart';

// Create a controller class for managing internet connectivity.
class ConnectivityController extends GetxController {
  // RxBool to track internet connectivity status.
  RxBool hasInternet = true.obs;

  // RxBool to track whether the error screen has been shown before.
  RxBool shownErrorScreenBefore = false.obs;

  @override
  void onInit() {
    super.onInit();
    startListening();
  }

  // Function to start listening to connectivity changes.
  void startListening() {
    Connectivity().onConnectivityChanged.listen((connectivityResult) async {
      var connectivityResult = await (Connectivity().checkConnectivity());

      // Update the hasInternet value based on connectivity status.
      hasInternet.value = (connectivityResult != ConnectivityResult.none);
      hasInternet.refresh();

      if (!hasInternet.value) {
        // If there's no internet, navigate to the error screen and mark it as shown.
        Get.offNamed(AppRoutes.errorScreen);
        shownErrorScreenBefore.value = true;
      } else {
        if (FirebaseAuth.instance.currentUser != null) {
          if (Get.overlayContext != null) {
            // Check if there's an overlay context and navigate accordingly.
            Navigator.of(Get.overlayContext!).canPop()
                ? Get.back()
                : Get.offNamed(AppRoutes.portfolioScreen);
          } else {
            Get.offNamed(AppRoutes.portfolioScreen);
          }
        } else if (shownErrorScreenBefore.value) {
          // If the error screen has been shown before, navigate to the login screen.
          Get.offNamed(AppRoutes.loginScreen);
        }
      }
    });
  }
}
