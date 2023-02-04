import 'package:flutter/material.dart';
import 'package:nectar_mac/App/Utils/Assets/app_images.dart';

class IntroHeader extends StatelessWidget {
  const IntroHeader({
    super.key,
    this.width,
    required this.height,
    this.child,
    this.bgImage = AppImages.authBg,
    this.aligment = Alignment.bottomCenter,
  });

  final double? width, height;
  final String? bgImage;
  final Widget? child;
  final AlignmentGeometry? aligment;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: aligment,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(bgImage!),
          fit: BoxFit.cover,
        ),
      ),
      child: child ??
          Image.asset(
            AppImages.location,
            width: width,
          ),
    );
  }
}
