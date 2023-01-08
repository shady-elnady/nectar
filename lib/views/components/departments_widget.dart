import 'package:flutter/material.dart';

class DepartmentsWidget extends StatefulWidget {
  const DepartmentsWidget({super.key});

  @override
  State<DepartmentsWidget> createState() => _DepartmentsWidgetState();
}

class _DepartmentsWidgetState extends State<DepartmentsWidget> {
  final myProducts = List<String>.generate(1000, (i) => 'Product $i');
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Exclusive Offer",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              "See all",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
