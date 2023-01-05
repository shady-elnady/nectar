// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

import '../../../config/app_images.dart';
import '../../../themes/app_fonts.dart';
import '../../widgets/Buttons/main_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.bg),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomCenter,
        child: SafeArea(
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
                  fontFamily: AppFonts.gilroy,
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
                  fontFamily: AppFonts.gilroy,
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
      ),
    );
  }
}
