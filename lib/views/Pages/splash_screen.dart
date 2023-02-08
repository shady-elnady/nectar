import 'package:flutter/material.dart';

import '../../App/Utils/Assets/app_images.dart';
import '../../Routes/index.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _vibratedController;
  late AnimationController _scaleController;

  late Animation<double> _scaleAnimation;

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
        await Future.delayed(const Duration(seconds: 1), () {
          _vibratedController.reset();
        });
        await Future.delayed(
          const Duration(seconds: 1),
          () => Navigator.pushReplacementNamed(
            context,
            RoutePages.wellcome,
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
      duration: const Duration(milliseconds: 50),
    );
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 20),
      reverseDuration: const Duration(milliseconds: 400),
    );

    Tween<double>(begin: 1, end: 2)
        .animate(_vibratedController)
        .addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          _vibratedController.repeat(reverse: true);
          _scaleController.forward();
        }
      },
    );
    _scaleAnimation = Tween<double>(begin: 1, end: 2).animate(_scaleController)
      ..addStatusListener(
        (status) async {
          if (status == AnimationStatus.completed) {
            await Future.delayed(const Duration(microseconds: 100));
            _scaleController.reverse();
            // _scaleController.repeat(reverse: true);
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
            child: AnimatedBuilder(
              animation: _scaleController,
              child: Hero(
                tag: "CarotImage",
                child: Image.asset(
                  AppImages.logo,
                  width: size.width / 2,
                ),
              ),
              builder: (BuildContext context, Widget? child) => Transform.scale(
                scale: _scaleAnimation.value,
                child: child!,
              ),
            ),
            builder: (BuildContext context, Widget? child) =>
                Transform.translate(
              offset: Offset(
                (size.width / 4.5) +
                    (size.width / 8 * _vibratedController.value),
                size.height / 2.3,
              ),
              child: child!,
            ),
          ),
        ],
      ),
    );
  }
}
