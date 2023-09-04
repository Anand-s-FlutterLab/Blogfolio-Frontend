import 'package:flutter/material.dart';

Widget customImageView({
  required String url,
  required double imgHeight,
  required double imgWidth,
  BoxFit fit = BoxFit.cover,
  double borderRadius = 12,
  double radiusTopLeft = 0,
  double radiusTopRight = 0,
  double radiusBottomLeft = 0,
  double radiusBottomRight = 0,
}) {
  return ClipRRect(
    borderRadius: borderRadius > 0
        ? BorderRadius.circular(borderRadius)
        : BorderRadius.only(
            bottomLeft: Radius.circular(radiusBottomLeft),
            topLeft: Radius.circular(radiusTopLeft),
            topRight: Radius.circular(radiusTopRight),
            bottomRight: Radius.circular(radiusBottomRight),
          ),
    child: Image(
      image: NetworkImage(url),
      height: imgHeight,
      width: imgWidth,
      fit: fit,
    ),
  );
}
