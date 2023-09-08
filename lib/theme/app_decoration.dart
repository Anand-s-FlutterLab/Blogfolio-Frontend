// Import the necessary packages and classes.
import 'package:flutter_frontend/core/app_export.dart';

// Define a class for managing app decorations.
class AppDecoration {
  static BoxDecoration inputBoxDecorationShadow() {
    return BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 5),
      )
    ]);
  }

  // Define a static method for button box decoration.
  static BoxDecoration buttonBoxDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(colors: [
        Colors.deepPurple.shade400,
        Colors.deepPurple,
        Colors.deepPurple.shade700,
      ]),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 10,
        )
      ],
    );
  }

  // Define a static method for container box decoration.
  static BoxDecoration containerBoxDecoration({
    double borderRadius = 12,
    Color color = Colors.white,
    double blurRadius = 7,
}) {
    return BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: blurRadius,
          )
        ]);
  }

  // Define a static method for input box decoration with shadow and border.
  static BoxDecoration inputBoxDecorationShadowWithBorder() {
    return BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
          )
        ],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade400));
  }


  // Define a method for text input decoration.
  InputDecoration textInputDecoration(
      {String lableText = "",
      String hintText = "",
      IconData icon = Icons.add}) {
    return InputDecoration(
      labelText: lableText,
      counterText: "",
      labelStyle: AppStyle.textFormFieldStyle(
          fontSize: width * 0.05, color: primaryColor),
      hintText: hintText,
      hintStyle: AppStyle.textFormFieldStyle(
          fontSize: width * 0.05, color: Colors.grey),
      errorStyle: AppStyle.textFormFieldStyle(
          fontSize: width * 0.05, color: Colors.red),
      fillColor: Colors.white,
      filled: true,
      contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      prefixIcon: Icon(icon, size: width * 0.06),
      prefixIconColor: primaryColor,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: primaryColor)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey.shade400)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red, width: 2.0)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red, width: 2.0)),
    );
  }
}
