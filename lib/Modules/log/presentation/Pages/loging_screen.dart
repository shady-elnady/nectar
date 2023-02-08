import 'package:flutter/material.dart';
import 'package:nectar_mac/App/Utils/Assets/app_images.dart';
import 'package:nectar_mac/views/Utils/constant.dart';
import 'package:nectar_mac/views/widgets/Buttons/main_button.dart';
import 'package:nectar_mac/views/widgets/text/custom_text.dart';
import 'package:nectar_mac/views/widgets/textFields/custom_text_field.dart';

import '../../../../Routes/index.dart';

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
                    child: InkWell(
                      child: Text(
                        "Forgot Password ?",
                        textAlign: TextAlign.end,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ),
                ),
                //
                const InkWell(
                  // onTap: () => Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const HomeScreen(),
                  //   ),
                  // ),
                  child: MainButton(
                    title: "Sgin In",
                    margin: 0,
                  ),
                ),
                //
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account? ",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      InkWell(
                        onTap: () => Navigator.pushReplacementNamed(
                          context,
                          RoutePages.signUpScreen,
                        ),
                        child: Text(
                          "Singup",
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
