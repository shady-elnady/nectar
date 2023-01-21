import 'package:flutter/material.dart';

import '../../../config/app_images.dart';
import '../01.intro/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _vibratedController;

  void startAnimation() async {
    await Future.doWhile(
      () async {
        await Future.delayed(
          const Duration(seconds: 2),
          () async {
            try {
              await _vibratedController.forward().orCancel;
            } on TickerCanceled {
              // print(
              //     "==============================TickerCanceled================================");
            }
          },
        );
        await Future.delayed(const Duration(seconds: 2), () {
          _vibratedController.reset();
        });
        await Future.delayed(
          const Duration(seconds: 1),
          () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const WelcomeScreen(),
            ),
          ),
        );
        return true;
      },
    );
  }

  @override
  void initState() {
    super.initState();

    _vibratedController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    Tween<double>(begin: 0, end: 1)
        .animate(_vibratedController)
        .addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          _vibratedController.repeat(reverse: true);
        }
      },
    );

    startAnimation();
  }

  @override
  void dispose() {
    _vibratedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _vibratedController,
            child: Image.asset(
              AppImages.logo,
              width: size.width * 0.55,
            ),
            builder: (BuildContext context, Widget? child) =>
                Transform.translate(
              offset: Offset(
                (size.width / 6) + (size.width / 6 * _vibratedController.value),
                size.height / 2.2,
              ),
              child: child!,
            ),
          ),
        ],
      ),
    );
  }
}
