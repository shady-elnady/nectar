import 'package:flutter/material.dart';

import '../../Utils/constant.dart';

class MainButton extends StatelessWidget {
  final String title;
  final Widget? widgetIcon;
  final Color? color;
  final double? margin;

  const MainButton({
    super.key,
    this.title = "Get Started",
    this.widgetIcon,
    this.color,
    this.margin = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: margin!),
      width: double.infinity,
      height: 65,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).primaryColor,
        borderRadius: UtilsWidget.borderRadius20,
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
