import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar_mac/views/Utils/loading_widget.dart';
import 'package:nectar_mac/views/widgets/Utils/error_widget.dart';

import '../Bloc/product_bloc.dart';
import 'Components/slider_product_item.dart';
import '../../../../../../views/widgets/textFields/search_field.dart';

class ExplorerTab extends StatelessWidget {
  const ExplorerTab({
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
      appBar: PreferredSize(
        preferredSize: Size(
          size.width,
          120,
        ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                alignment: Alignment.center,
                width: size.width - 85,
                height: 60,
                padding: const EdgeInsets.only(left: 30),
                decoration: BoxDecoration(
                  color: Theme.of(context).hintColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SearchField(
                  searchControl: productSearchControl,
                ),
              ),
              Icon(
                Icons.shopping_cart_outlined,
                color: Theme.of(context).primaryColorDark,
                size: 25,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
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
            : BlocBuilder<ProductBloc, ProductState>(
                // buildWhen: (previous, current) =>
                //     previous.DepartmentState != current.DepartmentState,
                builder: (context, state) {
                  if (state is LoadingProductsState) {
                    return const LoadingWidget();
                  } else if (state is LoadedProductsState) {
                    return RefreshIndicator(
                      onRefresh: () async =>
                          BlocProvider.of<ProductBloc>(context)
                              .add(RefreshProductsEvent()),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 175,
                          mainAxisExtent: 250,
                          childAspectRatio: 3 / 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                        ),
                        itemCount: state.products.length,
                        itemBuilder: (BuildContext context, index) =>
                            SliderProductItem(
                          product: state.products[index],
                          heroTag: searchWord ?? "ExplorerPage",
                        ),
                      ),
                    );
                  } else if (state is ErrorProductsState) {
                    return ErrorConnection(message: state.message);
                  }
                  return const LoadingWidget();
                },
              ),
      ),
    );
  }
}
