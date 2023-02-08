import 'package:flutter/material.dart';

class MyCartIcon extends StatelessWidget {
  const MyCartIcon({
    super.key,
    required this.count,
  });
  final int count;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      height: 45,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 20,
              height: 20,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.yellow,
                ),
              ),
              child: Text(
                "$count",
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          //
          const Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.home_max_outlined,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
