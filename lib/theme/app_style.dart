import 'package:flutter_frontend/core/app_export.dart';

class AppStyle {
  static textFormFieldStyle({
    double fontSize = 32,
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return GoogleFonts.getFont(
      'Signika Negative',
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
