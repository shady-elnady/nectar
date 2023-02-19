import 'package:flutter/material.dart';
import 'package:nectar_mac/App/Utils/Assets/app_fonts.dart';
import 'package:nectar_mac/views/components/intro_header.dart';

import 'package:nectar_mac/views/widgets/textFields/custom_text_field.dart';

import '../../../../Routes/index.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    FocusNode inputFocusNode = FocusNode();
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar:
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //
          IntroHeader(
            height: size.height / 4.5,
            // width: size.width / 1.6,
            aligment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    child: Icon(
                      Icons.keyboard_arrow_left_outlined,
                      size: 35,
                      color:
                          Theme.of(context).primaryColorDark.withOpacity(0.8),
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Enter your 4-digit code",
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 0, 25, 25),
            child: CustomTextField(
              controller: _codeController,
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
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontFamily: AppFonts.gilroy,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
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
                  backgroundColor: Theme.of(context).primaryColor,
                  child: const Icon(
                    Icons.keyboard_arrow_right_outlined,
                    size: 25,
                  ),
                  onPressed: () => Navigator.pushNamed(
                    context,
                    RoutePages.locationScreen,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
