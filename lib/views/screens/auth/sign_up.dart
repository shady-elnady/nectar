import 'package:flutter/material.dart';
import 'package:nectar_mac/themes/app_colors.dart';

import '../../../config/app_images.dart';
import '../../widgets/index.dart';

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
            height: size.height / 3.6,
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
                      style: Theme.of(context).textTheme.displaySmall,
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'Terms of Service ',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.primarySwatch,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: 'and '),
                        TextSpan(
                          text: 'Privacy Policy.',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.primarySwatch,
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
                ),
                //
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.titleColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.primarySwatch,
                          fontWeight: FontWeight.bold,
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
