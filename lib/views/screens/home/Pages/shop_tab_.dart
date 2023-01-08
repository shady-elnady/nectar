// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../../../../config/index.dart';

class ShopTabWidget extends StatefulWidget {
  const ShopTabWidget({Key? key}) : super(key: key);

  @override
  _ShopTabWidgetState createState() => _ShopTabWidgetState();
}

class _ShopTabWidgetState extends State<ShopTabWidget> {
  // This function show the sliver app bar
  // It will be called in each child of the TabBarView
  SliverAppBar showSliverAppBar(String screenTitle) {
    Size size = MediaQuery.of(context).size;
    return SliverAppBar(
      expandedHeight: 300.0,
      titleSpacing: 80,
      collapsedHeight: 80,
      floating: true,
      pinned: true,
      snap: false,
      elevation: 1,
      // backgroundColor: Colors.pink,
      // flexibleSpace: Column(
      //   children: [
      //     Image.asset(
      //       AppImages.carot,
      //       width: 27,
      //     ),
      //     Image.asset(
      //       AppImages.dhaka,
      //       width: size.width / 2.4,
      //       // height: 22,
      //     ),
      //     //
      //     Padding(
      //       padding: const EdgeInsets.symmetric(
      //         horizontal: 2,
      //         vertical: 20,
      //       ),
      //       child: TextField(
      //         style: Theme.of(context).dropdownMenuTheme.textStyle,
      //         cursorHeight: 25,
      //         decoration: InputDecoration(
      //           prefixIcon: const Icon(Icons.search),
      //           fillColor: Theme.of(context).dialogBackgroundColor,
      //           filled: true,
      //           border: const OutlineInputBorder(
      //             borderSide: BorderSide.none,
      //             borderRadius: BorderRadius.all(Radius.circular(15)),
      //           ),
      //           hintText: 'Search Store',
      //           hintStyle: Theme.of(context).textTheme.displaySmall,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      title: Column(
        children: [
          Image.asset(
            AppImages.carot,
            width: 27,
          ),
          Image.asset(
            AppImages.dhaka,
            width: size.width / 2.4,
            // height: 22,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          showSliverAppBar('Kindacode Home'),

          // Anther sliver widget: SliverList
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(
                height: 400,
                child: Center(
                  child: Text(
                    'Home Tab',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
              Container(
                height: 1500,
                color: Colors.green,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
