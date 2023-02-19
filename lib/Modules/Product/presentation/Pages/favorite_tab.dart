import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar_mac/App/Services/services_locator.dart';
import 'package:nectar_mac/views/Utils/loading_widget.dart';
import 'package:nectar_mac/views/widgets/Utils/error_widget.dart';

import 'package:nectar_mac/views/widgets/index.dart';
import '../Bloc/all_favorite_products_bloc/all_favorite_products_bloc.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: Text(
            "Favorurite",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 20,
                ),
          ),
          bottom: const PreferredSize(
            preferredSize: Size(double.infinity, 30),
            child: Divider(
              height: 40,
            ),
          ),
        ),
        body: BlocProvider(
          create: (BuildContext context) => sl<AllFavoriteProductsBloc>()
            ..add(
              GetAllFavoriteProductsEvent(),
            ),
          child: BlocBuilder<AllFavoriteProductsBloc, AllFavoriteProductsState>(
            // buildWhen: (previous, current) =>
            //     previous.AllFavoriteProductsState != current.AllFavoriteProductsState,
            builder: (context, state) {
              if (state is LoadingAllFavoriteProductsState) {
                return const LoadingWidget();
              } else if (state is LoadedAllFavoriteProductsState) {
                return RefreshIndicator(
                  onRefresh: () async =>
                      BlocProvider.of<AllFavoriteProductsBloc>(context)
                          .add(RefreshAllFavoriteProductsEvent()),
                  child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return const Divider(
                        height: 80,
                      );
                    },
                    itemCount: state.favoriteProducts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        // isThreeLine: true,
                        dense: false,
                        visualDensity:
                            const VisualDensity(horizontal: 3, vertical: 3),
                        title: Text(
                          "${state.favoriteProducts[index].product.name}.",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 16),
                        ),
                        subtitle: Text(
                          "${state.favoriteProducts[index].product.amount}${state.favoriteProducts[index].product.unit!.symbol}, Price",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        leading: Image.network(
                          state.favoriteProducts[index].product.image,
                          width: 95,
                          // height: 65,
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "${state.favoriteProducts[index].product.currency.code}${state.favoriteProducts[index].product.price}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(fontSize: 18),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, bottom: 4),
                                  child: InkWell(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              } else if (state is ErrorAllFavoriteProductsState) {
                return ErrorConnection(message: state.message);
              }
              return const LoadingWidget();
            },
          ),
        ),
        bottomSheet: const Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: MainButton(
            title: "Add All To Cart",
          ),
        ),
      ),
    );
  }
}
