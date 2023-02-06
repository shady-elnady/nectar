import 'package:flutter/material.dart';

class RouteNotFound extends StatelessWidget {
  const RouteNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Route Error"),
      ),
      body: Center(
        child: Text(
          "Page Not Found",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
