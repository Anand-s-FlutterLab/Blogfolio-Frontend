import 'package:flutter_frontend/core/app_export.dart';

SnackbarController customSnackBar(String title, String subtitle,
    [String colorSelector = "red"]) {
  Map<String, Color> colors = {
    'red': Colors.red,
    'green': Colors.green,
    'blue': Colors.blue,
  };
  Color? color = colors[colorSelector];
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
