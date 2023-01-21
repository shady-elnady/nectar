// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nectar_mac/config/index.dart';
import 'package:nectar_mac/themes/app_colors.dart';
import 'package:nectar_mac/themes/app_fonts.dart';
import 'package:nectar_mac/views/widgets/index.dart';

import '../../components/index.dart';
import 'number_screen.dart';

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
            height: size.height / 2.5,
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
                    style: Theme.of(context).textTheme.titleLarge,
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
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                      filled: false,
                      labelText: '',
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
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  //
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NumberScreen(),
                      ),
                    ),
                    child: MainButton(
                      title: "Continue with Google",
                      color: AppColors.googleColor,
                      margin: 5,
                      widgetIcon: Text(
                        "G",
                        style: TextStyle(
                          color: Theme.of(context).canvasColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 30,
                          fontFamily: AppFonts.gilroy,
                        ),
                      ),
                    ),
                  ),
                  //
                  MainButton(
                    title: "Continue with Facebook",
                    color: AppColors.faceBookColor,
                    margin: 5,
                    widgetIcon: Text(
                      "f",
                      style: TextStyle(
                        color: Theme.of(context).canvasColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 30,
                        fontFamily: AppFonts.gilroy,
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
