import 'package:flutter/material.dart';
import 'package:nectar_mac/views/widgets/index.dart';

import '../../../../../data/Models/user.dart';
import '../../../../../data/Providers/user_provider.dart';
import '../../../../widgets/Utils/error_widget.dart';

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
        body: FutureBuilder<List<User?>>(
          future: UserApi().getUser(),
          builder:
              (BuildContext context, AsyncSnapshot<List<User?>?>? snapshot) {
            switch (snapshot!.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return ErrorConnection(message: "${snapshot.error}");
                } else if (snapshot.data!.isEmpty) {
                  return const ErrorConnection(
                      title: "", message: "No User Found");
                } else {
                  return ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return const Divider(
                        height: 80,
                      );
                    },
                    itemCount: snapshot.data![0]!.favoritesProducts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        // isThreeLine: true,
                        dense: false,
                        visualDensity:
                            const VisualDensity(horizontal: 3, vertical: 3),
                        title: Text(
                          "${snapshot.data![0]!.favoritesProducts[index]!.name}.",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 16),
                        ),
                        subtitle: Text(
                          "${snapshot.data![0]!.favoritesProducts[index]!.amount}${snapshot.data![0]!.favoritesProducts[index]!.unit!.symbol}, Price",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        leading: Image.network(
                          snapshot.data![0]!.favoritesProducts[index]!.image,
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
                                  "${snapshot.data![0]!.favoritesProducts[index]!.currency.code}${snapshot.data![0]!.favoritesProducts[index]!.price}",
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
                  );
                }
            }
          },
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
