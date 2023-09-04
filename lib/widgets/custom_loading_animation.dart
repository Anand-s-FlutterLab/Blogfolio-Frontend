import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget customLoadingAnimation({
  required double size,
  Color color = Colors.white,
}) {
  return LoadingAnimationWidget.threeArchedCircle(
    color: color,
    size: size,
  );
}
