// Import the necessary package.
import 'package:flutter_frontend/core/app_export.dart';

// Define a custom snackbar controller function.
SnackbarController customSnackBar(String title, String subtitle,
    [String colorSelector = "red"]) {

  // Define a map to associate color selectors with colors.
  Map<String, Color> colors = {
    'red': Colors.red,
    'green': Colors.green,
    'blue': Colors.blue,
  };

  // Get the color based on the color selector.
  Color? color = colors[colorSelector];

  // Create and return a Get.snackbar widget.
  return Get.snackbar(
    title,
    subtitle,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: color!.withOpacity(0.2),
    barBlur: 30.0,
    borderRadius: 20,
    margin: const EdgeInsets.all(15),
    colorText: color,
    overlayBlur: 3,
    snackStyle: SnackStyle.FLOATING,
    duration: const Duration(seconds: 3),
    forwardAnimationCurve: Curves.easeInBack,
    titleText: Text(
      title,
      style: AppStyle.textFormFieldStyle(
          fontSize: width * 0.05,
          color: color,
          fontWeight: FontWeight.bold
      ),
    ),
    isDismissible: true,
    overlayColor: Colors.black.withOpacity(0.1),
    messageText: Text(
      subtitle,
      style: AppStyle.textFormFieldStyle(
          fontSize: width * 0.04,
          color: color,
          fontWeight: FontWeight.bold
      ),
    ),
  );
}
