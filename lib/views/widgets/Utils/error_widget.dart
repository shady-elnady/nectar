import 'package:flutter/material.dart';
import 'package:nectar_mac/views/Utils/constant.dart';

class ErrorConnection extends StatelessWidget {
  final String? title;
  final String? message;
  const ErrorConnection({
    super.key,
    this.title = "Error",
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 200,
      margin: UtilsWidget.edgeInsetsH30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: '$title\n',
          style: const TextStyle(
            fontSize: 25,
            color: Colors.red,
          ),
          children: <TextSpan>[
            const TextSpan(text: "\n"),
            TextSpan(
              text: message,
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
