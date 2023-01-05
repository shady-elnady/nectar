import 'package:flutter/material.dart';
import 'package:nectar_mac/themes/app_colors.dart';

import '../../../config/app_images.dart';
import '../../widgets/index.dart';

class LogingScreen extends StatelessWidget {
  const LogingScreen({super.key});

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
                const CustomText(),
                UtilsWidget.sizedBox35,
                // E-mail Field
                const CustomTextField(),
                //
                UtilsWidget.sizedBox35,
                // Password Field
                const CustomTextField(
                  label: "Password",
                ),
                //Forgot Password?
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: SizedBox(
                    width: size.width,
                    child: const InkWell(
                      child: Text(
                        "Forgot Password ?",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                //
                const MainButton(
                  title: "Sing In",
                ),
                //
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Don’t have an account? ",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.titleColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Singup",
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
