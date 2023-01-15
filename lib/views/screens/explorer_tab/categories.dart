import 'package:flutter/material.dart';
import 'package:nectar_mac/config/index.dart';

import '../../../data/Models/category.dart';
import '../../widgets/textFields/search_field.dart';

class Categories extends StatelessWidget {
  Categories({super.key});

  final List<Category> myProducts = List.generate(
    30,
    (index) =>
        const Category(name: 'Frash Fruits & Vegetable', image: AppImages.beef),
  ).toList();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final TextEditingController categoriesSearchControl =
        TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Find Products",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size(
            size.width,
            size.height / 10,
          ),
          child: SearchField(
            searchControl: categoriesSearchControl,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          // implement GridView.builder
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 175,
                mainAxisExtent: 190,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: myProducts.length,
              itemBuilder: (BuildContext ctx, index) {
                // Color color = Color((Random().nextDouble() * 0xFFDE598).toInt());
                return Container(
                  alignment: Alignment.bottomCenter,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: const Alignment(0, -0.5),
                      image: AssetImage(myProducts[index].image),
                      scale: 2.5,
                    ),
                    color: const Color.fromRGBO(83, 177, 117, 0.1),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: const Color.fromRGBO(83, 177, 117, 0.7),
                    ),
                  ),
                  child: Text(
                    myProducts[index].name,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                );
              }),
        ),
      ),
    );
  }
}
