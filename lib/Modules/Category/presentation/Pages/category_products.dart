import 'package:flutter/material.dart';
import 'package:nectar_mac/Modules/Product/presentation/Pages/Components/slider_product_item.dart';
import 'package:nectar_mac/views/widgets/index.dart';

import '../../../../../views/widgets/Utils/error_widget.dart';
import '../../../Product/domain/Entities/product.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({
    super.key,
    this.categoryName = "Beverages",
  });
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryName,
          style:
              Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 19),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            size: 22,
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
          padding: UtilsWidget.edgeInsetsVH20,
          child: FutureBuilder<List<Product>>(
            future:
                ProductApi().getCategoryProducts(categoryName: categoryName),
            builder:
                (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                default:
                  if (snapshot.hasError) {
                    return ErrorConnection(message: "${snapshot.error}");
                  } else if (snapshot.data!.isEmpty) {
                    return const ErrorConnection(
                        title: "", message: "No Product Yiet");
                  } else {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 175,
                        mainAxisExtent: 250,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return SliderProductItem(
                          product: snapshot.data![index],
                          heroTag: categoryName,
                        );
                      },
                    );
                  }
              }
            },
          ),
        ),
      ),
    );
  }
}
