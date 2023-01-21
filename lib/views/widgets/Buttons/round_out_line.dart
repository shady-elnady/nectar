import 'package:flutter/material.dart';

class RoundOutlineButton extends StatelessWidget {
  const RoundOutlineButton({
    super.key,
    this.child = const Icon(Icons.remove),
    this.size = const Size(45, 45),
    this.fun,
  });
  final Widget? child;
  final Size? size;
  final Function? fun;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(size),
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          return Theme.of(context).canvasColor;
        }),
        overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
          return Colors.transparent;
        }),
        side: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.hovered)) {
            return BorderSide(
              color: Theme.of(context).primaryColor,
              width: 1,
            );
          }
          return BorderSide(
            color: Theme.of(context).hintColor,
            width: 1,
          );
        }),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          );
        }),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: () {
        fun!();
      },
      child: child!,
    );
  }
}
