// Import the necessary package.
import 'package:flutter/material.dart';

// Define a custom image view widget.
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
  bool isAssetImage = false,
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
    child: isAssetImage
        ? Image(
      image: AssetImage(url),
      height: imgHeight,
      width: imgWidth,
      fit: fit,
    )
        : Image(
      image: NetworkImage(url),
      height: imgHeight,
      width: imgWidth,
      fit: fit,
    ),
  );
}
