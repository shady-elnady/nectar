import 'package:flutter/material.dart';

import '../../../data/Models/product.dart';
import '../../../data/Providers/product_provider.dart';
import '../../widgets/Utils/slider_product_item.dart';
import '../../widgets/textFields/search_field.dart';

class ProductSearch extends StatelessWidget {
  const ProductSearch({
    super.key,
    this.searchWord,
  });
  final String? searchWord;
  @override
  Widget build(BuildContext context) {
    TextEditingController productSearchControl = TextEditingController(
      text: searchWord,
    );
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        centerTitle: true,
        title: PreferredSize(
          preferredSize: Size(
            size.width,
            50,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                alignment: Alignment.center,
                width: size.width - 70,
                height: 55,
                decoration: BoxDecoration(
                    color: Theme.of(context).hintColor,
                    borderRadius: BorderRadius.circular(15)),
                child: SearchField(
                  searchControl: productSearchControl,
                ),
              ),
              Icon(
                Icons.shopping_cart_outlined,
                color: Theme.of(context).primaryColorDark,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        // implement GridView.builder
        child: productSearchControl.text == null
            ? Center(
                child: Text(
                  "Enter Search Word",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 50,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              )
            : FutureBuilder<List<Product>>(
                future:
                    ProductApi().getOneByName(name: productSearchControl.text),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Product>> snapshot) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 175,
                      mainAxisExtent: 250,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext ctx, index) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return const Center(
                              child: CircularProgressIndicator());
                        default:
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return SliderProductItem(
                              product: snapshot.data![index],
                            );
                          }
                      }
                    },
                  );
                },
              ),
      ),
    );
  }
}
