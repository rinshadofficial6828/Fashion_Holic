import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget spinKits({required Color colors}) {
  return LoadingAnimationWidget.fourRotatingDots(
          color: colors, size: 45);
}
