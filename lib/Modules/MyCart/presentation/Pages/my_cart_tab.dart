import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar_mac/App/Services/services_locator.dart';
import 'package:nectar_mac/views/Utils/loading_widget.dart';

import '../../../../../../../views/Utils/constant.dart';
import '../../../../../../../views/widgets/Buttons/main_button.dart';
import '../../../../../../../views/widgets/Buttons/round_out_line.dart';
import '../../../../../../../views/widgets/Utils/error_widget.dart';
import '../Bloc/my_cart_bloc/my_cart_bloc.dart';

class MyCartTab extends StatelessWidget {
  const MyCartTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          title: Text(
            "My Cart",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 20,
                ),
          ),
          bottom: const PreferredSize(
            preferredSize: Size(double.infinity, 30),
            child: Divider(
              height: 30,
            ),
          ),
        ),
        body: BlocProvider(
          create: (BuildContext context) => sl<MyCartBloc>()
            ..add(
              GetMyCartEvent(),
            ),
          child: BlocBuilder<MyCartBloc, MyCartState>(
            // buildWhen: (previous, current) =>
            //     previous.DepartmentState != current.DepartmentState,
            builder: (context, state) {
              if (state is LoadingMyCartState) {
                return const LoadingWidget();
              } else if (state is LoadedMyCartState) {
                return RefreshIndicator(
                  onRefresh: () async =>
                      BlocProvider.of<MyCartBloc>(context).add(
                    RefreshMyCartEvent(),
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return const Divider(
                        height: 80,
                      );
                    },
                    itemCount: state.myCart.myCartItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        isThreeLine: true,
                        dense: false,
                        visualDensity:
                            const VisualDensity(horizontal: 3, vertical: 3),
                        title: Text(
                          state.myCart.myCartItems[index]!.product.name,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 16),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "${state.myCart.myCartItems[index]!.product.amount}${state.myCart.myCartItems[index]!.product.unit!.symbol}, Price",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            //
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                RoundOutlineButton(
                                  fun: () {
                                    // TODO
                                  },
                                ),
                                Padding(
                                  padding: UtilsWidget.edgeInsetsH20,
                                  child: Text(
                                    "${state.myCart.myCartItems[index]!.amount}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Theme.of(context).primaryColorDark,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                RoundOutlineButton(
                                  fun: () {
                                    // TODO
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            //
                          ],
                        ),
                        leading: Image.network(
                          state.myCart.myCartItems[index]!.product.image,
                          width: 95,
                          // height: 65,
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              onTap: () {
                                // TODO
                              },
                              child: const Icon(Icons.close),
                            ),
                            Text(
                              "${state.myCart.myCartItems[index]!.product.currency.code}${state.myCart.myCartItems[index]!.product.price}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontSize: 18),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              } else if (state is ErrorMyCartState) {
                return ErrorConnection(message: state.message);
              }
              return const LoadingWidget();
            },
          ),
        ),
        bottomSheet: const Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: MainButton(
            title: "Go to Checkout",
          ),
        ),
      ),
    );
  }
}
