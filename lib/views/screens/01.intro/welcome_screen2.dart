import 'package:flutter/material.dart';

import '../../../config/app_images.dart';
import '../../widgets/Buttons/main_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            AppImages.bg,
            fit: BoxFit.cover,
            width: size.width,
            height: size.height,
          ),
          SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppImages.carotWhite,
                  width: 48,
                  height: 56,
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "Welcome\nto our store",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'font',
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Ger your groceries in as fast as one hour",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'font',
                    color: Color(0xB3FCFCFC),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const MainButton(
                  title: "Get Started",
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
