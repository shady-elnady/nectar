import 'package:flutter/material.dart';
import 'package:nectar_mac/App/Utils/Assets/app_images.dart';
import 'package:nectar_mac/views/Utils/constant.dart';
import 'package:nectar_mac/views/widgets/Buttons/main_button.dart';
import 'package:nectar_mac/views/widgets/text/custom_text.dart';
import 'package:nectar_mac/views/widgets/textFields/custom_text_field.dart';

import 'loging_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            height: size.height / 3.8,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.authBg),
                fit: BoxFit.cover,
              ),
            ),
            child: Image.asset(
              AppImages.carot,
              width: 50,
              height: 55,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text Container
                const CustomText(
                  title: "Sign Up",
                  subTitle: "Enter your credentials to continue",
                ),
                UtilsWidget.sizedBox35,
                // Username Field
                const CustomTextField(
                  label: "Username",
                  hint: "Afsar Hossen Shuvo",
                ),
                //
                UtilsWidget.sizedBox35,
                // E-mail Field
                CustomTextField(
                  icon: Icon(
                    Icons.done,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                //
                UtilsWidget.sizedBox35,
                // Password Field
                const CustomTextField(
                  label: "Password",
                ),
                //
                Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 20),
                  child: RichText(
                    text: TextSpan(
                      text: 'By continuing you agree to our ',
                      style: Theme.of(context).textTheme.bodySmall,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Terms of Service ',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                            text: '\n and ', style: TextStyle(height: 2)),
                        TextSpan(
                          text: 'Privacy Policy.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //
                const MainButton(
                  title: "Sing Up",
                  margin: 0,
                ),
                //
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      InkWell(
                        onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LogingScreen(),
                          ),
                        ),
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
