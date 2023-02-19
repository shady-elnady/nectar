import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar_mac/App/Services/services_locator.dart';
import 'package:nectar_mac/App/Utils/Assets/app_images.dart';
import 'package:nectar_mac/views/Utils/constant.dart';
import 'package:nectar_mac/views/Utils/loading_widget.dart';
import 'package:nectar_mac/views/Utils/snackbar_message.dart';
import 'package:nectar_mac/views/widgets/Buttons/main_button.dart';
import 'package:nectar_mac/views/widgets/text/custom_text.dart';
import 'package:nectar_mac/views/widgets/textFields/custom_text_field.dart';

import '../../../../Routes/index.dart';
import '../../domain/Entities/log.dart';
import '../bloc/log_bloc.dart';

class LogingScreen extends StatefulWidget {
  const LogingScreen({super.key});

  @override
  State<LogingScreen> createState() => _LogingScreenState();
}

class _LogingScreenState extends State<LogingScreen> {
  // final _logInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
            child: Form(
                // key: _logInFormKey,
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text Container
                const CustomText(),
                UtilsWidget.sizedBox35,
                // E-mail Field
                CustomTextField(
                  controller: _emailController,
                ),
                //
                UtilsWidget.sizedBox35,
                // Password Field
                CustomTextField(
                  controller: _passwordController,
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
                InkWell(
                  onTap: validateFormThenLogIn,
                  child: const MainButton(
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
            )),
          ),
        ],
      ),
    );
  }

  void validateFormThenLogIn() {
    // final isValid = _logInFormKey.currentState!.validate();
    Navigator.of(context).pushNamedAndRemoveUntil(
      RoutePages.homeScreen,
      (route) => false,
    );
    // if (true) {
    //   final Log logInParameter = Log(
    //     email: _emailController.text,
    //     password: _passwordController.text,
    //   );
    //   BlocProvider.of<LogBloc>(context).add(
    //     LogInEvent(
    //       logParameter: logInParameter,
    //     ),
    //   );
    // }
  }
}
