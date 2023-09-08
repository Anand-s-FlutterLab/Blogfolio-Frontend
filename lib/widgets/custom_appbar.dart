// Import the necessary package.
import 'package:flutter_frontend/core/app_export.dart';

// Define a custom app bar widget.
PreferredSizeWidget customAppbar({required String title}) {
  return AppBar(
    // Disable the automatic back button.
    automaticallyImplyLeading: false,

    // Center the title in the app bar.
    centerTitle: true,

    // Define a custom leading widget (back button).
    leading: GestureDetector(
      onTap: () => Get.back(),
      child: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: blackColor,
      ),
    ),

    // Set the title text with custom styling.
    title: customText(
      color: blackColor,
      fontSize: width * 0.06,
      text: title,
    ),

    // Set the app bar background color to white.
    backgroundColor: whiteColor,

    // Remove the app bar elevation.
    elevation: 0,
  );
}
