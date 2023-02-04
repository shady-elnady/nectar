import 'package:flutter/material.dart';
import 'package:nectar_mac/views/Utils/constant.dart';
import 'package:nectar_mac/views/components/intro_header.dart';
import 'package:nectar_mac/views/widgets/Buttons/main_button.dart';
import 'package:nectar_mac/views/widgets/text/custom_text.dart';
import 'package:nectar_mac/views/widgets/textFields/custom_drop_menu.dart';

import '../auth/loging_screen.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left_outlined,
            size: 45,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //
          IntroHeader(
            height: size.height / 2.8,
            width: size.width / 1.6,
          ),
          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UtilsWidget.sizedBox35,
                // Text Container
                const CustomText(
                  center: true,
                  title: "Select Your Location",
                  subTitle:
                      "Swithch on your location to stay in tune with what’s happening in your area",
                ),
                //
                UtilsWidget.sizedBox55,
                UtilsWidget.sizedBox55,
                // Your Zone
                const CustomDropMenu(
                  label: "Your Zone",
                ),
                //
                UtilsWidget.sizedBox35,
                // Your Area
                const CustomDropMenu(
                  label: "Your Area",
                  hint: "Types of your area",
                ),
                //
                //
                UtilsWidget.sizedBox35,

                InkWell(
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LogingScreen(),
                    ),
                  ),
                  child: const MainButton(
                    title: "Submit",
                    margin: 0,
                  ),
                ),
                //
              ],
            ),
          ),
        ],
      ),
    );
  }
}
