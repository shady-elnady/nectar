import 'package:flutter/material.dart';

class OrignalButton extends StatelessWidget {
  final String title;
  const OrignalButton({
    super.key,
    this.title = "Skip",
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // <-- Radius
        ),
      ),
      child: Text(title),
    );
  }
}
