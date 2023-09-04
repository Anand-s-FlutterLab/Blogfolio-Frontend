import 'package:flutter_frontend/core/app_export.dart';

class AppStyle {
  static textFormFieldStyle({
    double fontSize = 32,
    Color color = Colors.black,
  }) {
    return GoogleFonts.getFont(
      'Signika Negative',
      fontSize: fontSize,
      color: color,
    );
  }
}
