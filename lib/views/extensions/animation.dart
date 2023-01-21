import 'package:flutter/material.dart';

extension AnimationControllers on AnimationController {
  void repeatEx({required int times}) {
    int count = 0;
    addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (++count < times) {
          reverse();
        }
      } else if (status == AnimationStatus.dismissed) {
        forward();
      }
    });
  }
}
