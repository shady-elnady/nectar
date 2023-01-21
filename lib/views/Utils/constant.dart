import 'package:flutter/material.dart';

class UtilsWidget {
  // SizedBox
  static const SizedBox sizedBox15 = SizedBox(
    height: 15,
  );
  static const SizedBox sizedBox25 = SizedBox(
    height: 25,
  );
  static const SizedBox sizedBox35 = SizedBox(
    height: 35,
  );
  static const SizedBox sizedBox45 = SizedBox(
    height: 45,
  );
  static const SizedBox sizedBox55 = SizedBox(
    height: 55,
  );
  static const SizedBox sizedBox65 = SizedBox(
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

  // EdgeInsets
  static const EdgeInsets edgeInsetsV20 = EdgeInsets.symmetric(
    vertical: 20,
  );

  static const EdgeInsets edgeInsetsV30 = EdgeInsets.symmetric(
    vertical: 30,
  );

  static const EdgeInsets edgeInsetsH20 = EdgeInsets.symmetric(
    horizontal: 20,
  );

  static const EdgeInsets edgeInsetsH30 = EdgeInsets.symmetric(
    horizontal: 30,
  );

  static const EdgeInsets edgeInsetsVH20 = EdgeInsets.symmetric(
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

  // Divider
  static const Divider divider = Divider(
    height: 50,
    thickness: 1,
  );

  // BorderRadius
  static BorderRadius borderRadius20 = BorderRadius.circular(20);

  // Duration
  static const durationS2 = Duration(seconds: 2);
}
