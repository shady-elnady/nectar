import 'package:flutter/material.dart';

import 'package:nectar_mac/views/widgets/textFields/custom_text_field.dart';

import '../../components/index.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    FocusNode inputFocusNode = FocusNode();
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
            height: size.height / 4,
            // width: size.width / 1.6,
            aligment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                "Enter your 4-digit code",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: CustomTextField(
              label: "Code",
              hint: "- - - -",
              foucNode: inputFocusNode,
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 45.0,
              bottom: 40,
            ),
            child: Text(
              "Resend Code",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 5.0,
              bottom: 40,
            ),
            child: SizedBox(
              width: 70,
              height: 70,
              child: FittedBox(
                child: FloatingActionButton(
                  child: const Icon(
                    Icons.keyboard_arrow_right_outlined,
                    size: 25,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
