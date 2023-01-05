import 'package:flutter/material.dart';

import '../../components/index.dart';
import '../../widgets/index.dart';

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
          onPressed: () {},
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
              children: const [
                UtilsWidget.sizedBox35,
                // Text Container
                 CustomText(
                  center: true,
                  title: "Select Your Location",
                  subTitle:
                      "Swithch on your location to stay in tune with what’s happening in your area",
                ),
                //
                UtilsWidget.sizedBox55,
                UtilsWidget.sizedBox55,
                // Your Zone
                 CustomDropMenu(
                  label: "Your Zone",
                ),
                //
                UtilsWidget.sizedBox35,
                // Your Area
                 CustomDropMenu(
                  label: "Your Area",
                  hint: "Types of your area",
                ),
                //
                //
                UtilsWidget.sizedBox35,

                MainButton(
                  title: "Submit",
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
