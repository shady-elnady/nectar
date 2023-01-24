import 'package:flutter/material.dart';
import 'package:nectar_mac/views/Utils/constant.dart';

import '../../../config/app_images.dart';
import '../../widgets/Buttons/animated_button.dart';
import '../../widgets/Buttons/main_button.dart';
import 'Widgets/botom_sheet.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _start = false;
  bool _showLanguages = false;
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
                Tooltip(
                  message: "Double Click > Languages",
                  child: InkWell(
                    onDoubleTap: () => setState(() {
                      _showLanguages = !_showLanguages;
                    }),
                    child: Hero(
                      tag: "CarotImage",
                      child: Image.asset(
                        AppImages.carotWhite,
                        width: 48,
                        height: 56,
                      ),
                    ),
                  ),
                ),
                UtilsWidget.sizedBox25,
                Text(
                  "Welcome\nto our store",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelLarge!,
                ),
                Text(
                  "Ger your groceries in as fast as one hour",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(fontSize: 15, fontWeight: FontWeight.w200),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 75),
                  child: !_start
                      ? InkWell(
                          onTap: () => setState(() {
                            _start = true;
                          }),
                          child: const MainButton(
                            title: "Get Started",
                          ),
                        )
                      : AnimatedTransButton(
                          start: _start,
                        ),
                ),
              ],
            ),
          ),
          if (_showLanguages) const BottomSheetTransition(),
        ],
      ),
    );
  }
}
