import 'package:flutter/material.dart';
import 'package:nectar_mac/data/Models/lines_in_card.dart';
import 'package:nectar_mac/views/widgets/index.dart';

import '../../../../data/Models/cart.dart';
import '../../../../data/Providers/cart_provider.dart';
import '../../../../data/Providers/line_in_cart_provider.dart';
import '../../../widgets/Buttons/round_out_line.dart';
import '../../../widgets/Utils/error_widget.dart';

class MyCrat extends StatefulWidget {
  const MyCrat({super.key});

  @override
  State<MyCrat> createState() => _MyCratState();
}

class _MyCratState extends State<MyCrat> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 110,
          title: Text(
            "My Cart",
            style:
                Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 20),
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
                  List<LinesInCard>? linesInCard =
                      snapshot.data![0]!.linesInCard;
                  return ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return const Divider(
                        height: 80,
                      );
                    },
                    itemCount: linesInCard!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        isThreeLine: true,
                        dense: false,
                        visualDensity:
                            const VisualDensity(horizontal: 3, vertical: 3),
                        title: Text(
                          linesInCard[index].product!.name,
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
                              "${linesInCard[index].product!.amount}${linesInCard[index].product!.unit!.symbol}, Price",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            //
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                RoundOutlineButton(
                                  fun: () => linesInCard[index].amount > 1
                                      ? LineInCartApi().updateOne(
                                          url: linesInCard[index].url,
                                          amount: linesInCard[index].amount - 1,
                                        )
                                      : null,
                                ),
                                Padding(
                                  padding: UtilsWidget.edgeInsetsH20,
                                  child: Text(
                                    "${linesInCard[index].amount}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Theme.of(context).primaryColorDark,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () => LineInCartApi().updateOne(
                                    url: linesInCard[index].url,
                                    amount: linesInCard[index].amount + 1,
                                  ),
                                  child: RoundOutlineButton(
                                    child: Icon(
                                      Icons.add,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //
                          ],
                        ),
                        leading: Image.network(
                          linesInCard[index].product!.image,
                          width: 95,
                          // height: 65,
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const InkWell(child: Icon(Icons.close)),
                            Text(
                              "${linesInCard[index].product!.currency.code}${linesInCard[index].product!.price}",
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
