import 'package:flutter/material.dart';
import 'package:nectar_mac/views/widgets/Utils/error_widget.dart';
import 'package:nectar_mac/Modules/Product/presentation/Pages/Components/slider_product_item.dart';

import '../../domain/Entities/product.dart';

class Groceries extends StatelessWidget {
  const Groceries({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: ProductApi().getAll(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          default:
            if (snapshot.hasError) {
              return ErrorConnection(message: "${snapshot.error}");
            } else {
              List<Product> products = snapshot.data;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //
                  SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: ListView(
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        ...products.map(
                          (Product product) => Container(
                            alignment: Alignment.centerLeft,
                            height: 150,
                            width: 250,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            margin: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 20,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(248, 164, 76, 0.15),
                              borderRadius: BorderRadius.circular(18),
                              // border: Border.all(
                              //   color: Colors.transparent,
                              //   width: 1,
                              //   style: BorderStyle.solid,
                              // ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  product.category!.image,
                                  width: 80,
                                  height: 80,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    product.category!.name,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Theme.of(context).primaryColorDark,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //
                  SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: SliderProductItem(
                            product: products[index],
                            heroTag: products[index].category!.name,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
        }
      },
    );
  }
}
