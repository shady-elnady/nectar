import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    this.title = "Loging",
    this.subTitle = "Enter your emails and password",
    this.center = false,
  });
  final String subTitle, title;
  final bool center;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment:
          center ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          title,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(
          height: 10,
        ),
        // Sub Tilte
        Text(
          subTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }
}
