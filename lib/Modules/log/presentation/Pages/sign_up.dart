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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
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
            child: BlocConsumer<LogBloc, LogState>(listener: (context, state) {
              if (state is MeassageLogState) {
                SnackBarMessage().showSuccessSnackBar(
                  message: state.message,
                  context: context,
                );
                Navigator.of(context).pushNamedAndRemoveUntil(
                  RoutePages.homeScreen,
                  (route) => false,
                );
              } else if (state is ErrorLogState) {
                SnackBarMessage().showErrorSnackBar(
                  message: state.message,
                  context: context,
                );
              }
            }, builder: (context, state) {
              if (state is LoadingLogState) {
                return const LoadingWidget();
              }
              return Form(
                // key: _formKey,
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
                    CustomTextField(
                      controller: _userController,
                      label: "Username",
                      hint: "Afsar Hossen Shuvo",
                    ),
                    //
                    UtilsWidget.sizedBox35,
                    // E-mail Field
                    CustomTextField(
                      controller: _emailController,
                      icon: Icon(
                        Icons.done,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    //
                    UtilsWidget.sizedBox35,
                    // Password Field
                    CustomTextField(
                      controller: _passwordController,
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
                            onTap: () => Navigator.pushReplacementNamed(
                              context,
                              RoutePages.logingScreen,
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
              );
            }),
          ),
        ],
      ),
    );
  }

  void validateFormThenLogIn() {
    // final isValid = _formKey.currentState!.validate();

    if (true) {
      final Log logInParameter = Log(
        username: _userController.text,
        email: _emailController.text,
        password: _passwordController.text,
      );
      BlocProvider.of<LogBloc>(context).add(
        LogUpEvent(
          logParameter: logInParameter,
        ),
      );
    }
  }
}
