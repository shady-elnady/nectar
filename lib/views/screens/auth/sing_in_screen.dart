// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nectar_mac/config/index.dart';
import 'package:nectar_mac/themes/app_colors.dart';
import 'package:nectar_mac/views/widgets/index.dart';

import '../../components/index.dart';

class SingInScreen extends StatelessWidget {
  const SingInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    FocusNode inputNode = FocusNode();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //
          IntroHeader(
            bgImage: AppImages.singInBG,
            height: size.height / 2.2,
            width: size.width,
            aligment: Alignment.bottomLeft,
            child: const Padding(
              padding: EdgeInsets.all(25.0),
            ),
          ),
          //

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: SizedBox(
              width: size.width,
              height: size.height / 2.1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Get your groceries \nwith nectar",
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  //
                  IntlPhoneField(
                    autofocus: true,
                    focusNode: inputNode,
                    keyboardType: TextInputType.phone,
                    // initialValue: "",
                    style: Theme.of(context).dropdownMenuTheme.textStyle,
                    dropdownTextStyle:
                        Theme.of(context).dropdownMenuTheme.textStyle,
                    decoration: InputDecoration(
                      labelText: '',
                      border: Theme.of(context).inputDecorationTheme.border,
                      focusedBorder:
                          Theme.of(context).inputDecorationTheme.border,
                    ),
                    initialCountryCode: 'BD',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  ),
                  //
                  SizedBox(
                    width: size.width,
                    height: 30,
                    child: Text(
                      "Or connect with social media",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  //
                  MainButton(
                    title: "Continue with Google",
                    color: AppColors.googleColor,
                    widgetIcon: Text(
                      "G",
                      style: TextStyle(
                        color: Theme.of(context).canvasColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 35,
                      ),
                    ),
                  ),
                  //
                  MainButton(
                    title: "Continue with Facebook",
                    color: AppColors.faceBookColor,
                    widgetIcon: Text(
                      "f",
                      style: TextStyle(
                        color: Theme.of(context).canvasColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 35,
                      ),
                    ),
                  ),
                  //
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
