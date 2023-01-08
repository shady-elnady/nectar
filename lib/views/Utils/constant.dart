import 'package:flutter/material.dart';

class UtilsWidget {
  // SizedBox
  static const sizedBox15 = SizedBox(
    height: 15,
  );
  static const sizedBox25 = SizedBox(
    height: 25,
  );
  static const sizedBox35 = SizedBox(
    height: 35,
  );
  static const sizedBox45 = SizedBox(
    height: 45,
  );
  static const sizedBox55 = SizedBox(
    height: 55,
  );
  static const sizedBox65 = SizedBox(
    height: 65,
  );

  static SizedBox sizedBox({
    double? width,
    double? height,
  }) =>
      SizedBox(
        width: width,
        height: height,
      );

  // Padding
  static const paddingV20 = EdgeInsets.symmetric(
    vertical: 20,
  );

  static const paddingH20 = EdgeInsets.symmetric(
    horizontal: 20,
  );

  static const paddingVH20 = EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 20,
  );

  static EdgeInsets padding({
    double vertical = 0,
    double horizontal = 0,
  }) =>
      EdgeInsets.symmetric(
        horizontal: horizontal,
        vertical: vertical,
      );
}
