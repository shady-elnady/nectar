// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nectar_mac/themes/app_fonts.dart';
import 'package:nectar_mac/views/widgets/index.dart';

import '../../components/intro_header.dart';
import 'verification_screen.dart';

class NumberScreen extends StatelessWidget {
  const NumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    FocusNode inputNode = FocusNode();
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            IntroHeader(
              height: size.height / 6.5,
              // width: size.width / 1.6,
              aligment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    UtilsWidget.sizedBox15,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.keyboard_arrow_left_outlined,
                            size: 35,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //

            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0, 25, 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter your mobile number",
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  UtilsWidget.sizedBox25,
                  Text(
                    'Mobile Number',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  IntlPhoneField(
                    autofocus: true,
                    focusNode: inputNode,
                    keyboardType: TextInputType.phone,
                    // initialValue: "",
                    style: TextStyle(
                      color: Theme.of(context).primaryColorDark,
                      fontSize: 18,
                      fontFamily: AppFonts.gilroy,
                      fontWeight: FontWeight.w600,
                    ),
                    dropdownTextStyle:
                        Theme.of(context).dropdownMenuTheme.textStyle,
                    decoration: InputDecoration(
                      filled: false,
                      labelText: '',
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                      // border: InputBorder.none,
                    ),
                    initialCountryCode: 'BD',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SizedBox(
          width: 70,
          height: 70,
          child: FittedBox(
            child: FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
                child: const Icon(
                  Icons.keyboard_arrow_right_outlined,
                  size: 28,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VerificationScreen(),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
