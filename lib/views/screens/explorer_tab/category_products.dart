import 'package:flutter/material.dart';
import 'package:nectar_mac/config/index.dart';

import '../../../data/Models/currency.dart';
import '../../../data/Models/product.dart';
import '../../../data/Models/unit.dart';
import '../../widgets/Utils/slider_product_item.dart';

class CategoryProducts extends StatelessWidget {
  CategoryProducts({
    super.key,
    this.categoryName = "Beverages",
  });
  final String categoryName;
  final List<Product> myProducts = List.generate(
    30,
    (index) => const Product(
      name: 'Diet Coke',
      image: AppImages.apple,
      price: 4.99,
      amount: 1.5,
      unit: Unit(name: "dolar", symbol: "Kg"),
      currency: Currency(
        name: "dolar",
        code: "\$",
      ),
    ),
  ).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryName,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.horizontal_split_sharp,
              size: 25,
              color: Theme.of(context).primaryColorDark,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          // implement GridView.builder
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 175,
              mainAxisExtent: 250,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            itemCount: myProducts.length,
            itemBuilder: (BuildContext ctx, index) {
              return SliderProductItem(
                product: myProducts[index],
              );
              // Color color = Color((Random().nextDouble() * 0xFFDE598).toInt());
              // return Container(
              //   alignment: Alignment.bottomCenter,
              //   padding:
              //       const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       alignment: const Alignment(0, -0.5),
              //       image: AssetImage(myProducts[index].image),
              //       scale: 2.5,
              //     ),
              //     color: const Color.fromRGBO(83, 177, 117, 0.1),
              //     borderRadius: BorderRadius.circular(18),
              //     border: Border.all(
              //       color: const Color.fromRGBO(83, 177, 117, 0.7),
              //     ),
              //   ),
              //   child: Text(
              //     myProducts[index].name,
              //     maxLines: 2,
              //     textAlign: TextAlign.center,
              //     softWrap: true,
              //     style: Theme.of(context).textTheme.labelSmall,
              //   ),
              // );
            },
          ),
        ),
      ),
    );
  }
}

/*
add_shopping_cart_outlined → const IconData
add_shopping_cart — material icon named "add shopping cart" (outlined).


shopping_cart_outlined 


*/