import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar_mac/views/Utils/loading_widget.dart';

import 'package:nectar_mac/views/widgets/Utils/error_widget.dart';
import 'package:nectar_mac/Modules/Product/presentation/Pages/Components/slider_product_item.dart';

import '../../domain/Entities/product.dart';
import '../Bloc/all_products_bloc/all_products_bloc.dart';

class Groceries extends StatelessWidget {
  const Groceries({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllProductBloc, AllProductState>(
      // buildWhen: (previous, current) =>
      //     previous.DepartmentState != current.DepartmentState,
      builder: (context, state) {
        if (state is LoadingAllProductsState) {
          return const LoadingWidget();
        } else if (state is LoadedAllProductsState) {
          return RefreshIndicator(
            onRefresh: () async => BlocProvider.of<AllProductBloc>(context)
                .add(RefreshAllProductsEvent()),
            child: Column(
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
                      ...state.products.map(
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
                    itemCount: state.products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: SliderProductItem(
                          product: state.products[index],
                          heroTag: state.products[index].category!.name,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else if (state is ErrorAllProductsState) {
          return ErrorConnection(message: state.message);
        }
        return const LoadingWidget();
      },
    );
  }
}
