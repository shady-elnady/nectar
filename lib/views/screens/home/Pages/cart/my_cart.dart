import 'package:flutter/material.dart';
import 'package:nectar_mac/data/Models/lines_in_card.dart';

import '../../../../../data/Models/cart.dart';
import '../../../../../data/Providers/cart_provider.dart';
import '../../../../Utils/constant.dart';
import '../../../../widgets/Buttons/round_out_line.dart';
import '../../../../widgets/Utils/error_widget.dart';

class MyCart extends StatelessWidget {
  MyCart({
    super.key,
  });
  late List<LinesInCard?> _myCart;

  void addToCart({
    required LinesInCard oneLine,
  }) {
    _myCart.add(oneLine);
  }

  void removeLineInCart({
    required int index,
  }) {
    _myCart.removeAt(index);
  }

  void updateAmount({
    required int amount,
    required int index,
  }) {
    LinesInCard newLine = LinesInCard(
      card: _myCart[index]!.card,
      product: _myCart[index]!.product,
      amount: amount,
      totalLinePrice: _myCart[index]!.product!.price * amount,
      slug: _myCart[index]!.slug,
    );
    _myCart.removeAt(index);
    _myCart.insert(index, newLine);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 110,
          title: Text(
            "My Cart",
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
        body: FutureBuilder<List<Cart?>>(
          future: CartApi().getMyCart(),
          builder: (BuildContext context, AsyncSnapshot<List<Cart?>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return ErrorConnection(message: "${snapshot.error}");
                } else if (snapshot.data!.isEmpty) {
                  return const ErrorConnection(
                      title: "", message: "No Card Yiet");
                } else {
                  _myCart = snapshot.data![0]!.linesInCard;
                  return ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return const Divider(
                        height: 80,
                      );
                    },
                    itemCount: _myCart.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        isThreeLine: true,
                        dense: false,
                        visualDensity:
                            const VisualDensity(horizontal: 3, vertical: 3),
                        title: Text(
                          _myCart[index]!.product!.name,
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
                              "${_myCart[index]!.product!.amount}${_myCart[index]!.product!.unit!.symbol}, Price",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            //
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                RoundOutlineButton(
                                  fun: () => updateAmount(
                                    index: index,
                                    amount: _myCart[index]!.amount - 1,
                                  ),
                                ),
                                Padding(
                                  padding: UtilsWidget.edgeInsetsH20,
                                  child: Text(
                                    "${_myCart[index]!.amount}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Theme.of(context).primaryColorDark,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                RoundOutlineButton(
                                  fun: () {
                                    updateAmount(
                                      index: index,
                                      amount: _myCart[index]!.amount + 1,
                                    );
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
                          _myCart[index]!.product!.image,
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
                                removeLineInCart(index: index);
                              },
                              child: const Icon(Icons.close),
                            ),
                            Text(
                              "${_myCart[index]!.product!.currency.code}${_myCart[index]!.product!.price}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontSize: 18),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
            }
          },
        ),
      ),
    );
  }
}
