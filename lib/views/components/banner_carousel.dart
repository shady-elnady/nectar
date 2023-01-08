// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController controller = PageController();
  List<Widget> list = const <Widget>[
    Center(
      child: Pages(
        text: "Page 1",
      ),
    ),
    Center(
      child: Pages(
        text: "Page 2",
      ),
    ),
    Center(
      child: Pages(
        text: "Page 3",
      ),
    ),
    Center(
      child: Pages(
        text: "Page 4",
      ),
    )
  ];
  int _curr = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("GeeksforGeeks"),
        backgroundColor: Colors.green,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              "Page: ${_curr + 1}/${list.length}",
              textScaleFactor: 2,
            ),
          )
        ],
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,

        // reverse: true,
        // physics: BouncingScrollPhysics(),
        controller: controller,
        onPageChanged: (int num) {
          setState(() {
            _curr = num;
          });
        },
        children: list,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FloatingActionButton(
              onPressed: () {
                setState(() {
                  list.add(
                    const Center(
                        child:
                            Text("New page", style: TextStyle(fontSize: 35.0))),
                  );
                });
                if (_curr != list.length - 1) {
                  controller.jumpToPage(_curr + 1);
                } else {
                  controller.jumpToPage(0);
                }
              },
              child: const Icon(Icons.add)),
          FloatingActionButton(
              onPressed: () {
                list.removeAt(_curr);
                setState(() {
                  controller.jumpToPage(_curr - 1);
                });
              },
              child: const Icon(Icons.delete)),
        ],
      ),
    );
  }
}

class Pages extends StatelessWidget {
  final String text;
  const Pages({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
