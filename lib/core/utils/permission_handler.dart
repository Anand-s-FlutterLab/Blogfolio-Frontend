// Import the necessary packages and classes.
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_frontend/routes/app_routes.dart';

// Create a controller class for managing app permissions.
class PermissionManager extends GetxController {
  @override
  void onInit() {
    super.onInit();

    // Request required permissions when the controller is initialized.
    requestRequiredPermissions();
  }

  // Check if a permission is granted.
  static Future<bool> isPermissionGranted(Permission permission) async {
    return !(await permission.status.isDenied ||
        await permission.status.isRestricted);
  }

  // Ask for a permission if it is not granted.
  static Future<void> askForPermission(Permission permission) async {
    if (!await isPermissionGranted(permission)) {
      await permission.request();
    }
  }

  // Request the required permissions for the app.
  static Future<void> requestRequiredPermissions() async {
    // Ask for storage permission.
    await askForPermission(Permission.storage);

    // If storage permission is not granted, navigate to the permission error screen.
    if (!await isPermissionGranted(Permission.storage)) {
      Get.offAllNamed(AppRoutes.permissionErrorScreen);
    }
  }
}
