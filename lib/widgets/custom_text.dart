import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customText({
  String text = "",
  Color color = Colors.black,
  double fontSize = 18,
  FontWeight fontWeight = FontWeight.normal,
  int maxLines = 1,
  TextAlign textAlign = TextAlign.center,
  TextOverflow textOverflow = TextOverflow.ellipsis,
  bool maxLinesEnabled = false
}) {
  return Text(
    text,
    style: GoogleFonts.signikaNegative(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
    maxLines: maxLinesEnabled ? null : maxLines,
    textAlign: textAlign,
    overflow: textOverflow,
  );
}