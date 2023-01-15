import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String title;
  final Widget? widgetIcon;
  final Color? color;

  const MainButton({
    super.key,
    this.title = "Get Started",
    this.widgetIcon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      height: 65,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Stack(
          children: [
            //
            Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            //
            Align(
              alignment: Alignment.centerLeft,
              child: widgetIcon,
            ), //
          ],
        ),
      ),
    );
  }
}
