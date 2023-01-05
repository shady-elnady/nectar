
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:intl_phone_field/intl_phone_field.dart';

import '../../components/index.dart';

class NumberScreen extends StatelessWidget {
  const NumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    FocusNode inputNode = FocusNode();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left_outlined,
            size: 45,
          ),
          onPressed: () {},
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //
          IntroHeader(
            height: size.height / 4,
            // width: size.width / 1.6,
            aligment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                "Enter your mobile number",
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ),
          //

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mobile Number',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
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
              ],
            ),
          )
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SizedBox(
          width: 70,
          height: 70,
          child: FittedBox(
            child: FloatingActionButton(
                child: const Icon(
                  Icons.keyboard_arrow_right_outlined,
                  size: 25,
                ),
                onPressed: () {}),
          ),
        ),
      ),
    );
  }
}
