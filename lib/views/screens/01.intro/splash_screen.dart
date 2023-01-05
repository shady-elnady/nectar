import 'package:flutter/material.dart';

import '../../../config/app_images.dart';
import '../../../themes/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primarySwatch,
      body: Center(
        child: Image.asset(
          AppImages.logo,
          width: size.width * 0.55,
          height: 100,
        ),
      ),
    );
  }
}
