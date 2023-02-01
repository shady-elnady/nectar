import 'package:flutter/material.dart';
import 'package:nectar_mac/views/widgets/index.dart';

import '../../../Modules/Category/domain/Entities/category.dart';
import '../../../data/Providers/category_provider.dart';
import '../../widgets/Utils/error_widget.dart';
import '../../widgets/textFields/search_field.dart';
import 'category_products.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final TextEditingController categoriesSearchControl =
        TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Find Products",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size(
            size.width,
            size.height / 10,
          ),
          child: Padding(
            padding: UtilsWidget.edgeInsetsH20,
            child: SearchField(
              searchControl: categoriesSearchControl,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          // implement GridView.builder
          child: FutureBuilder<List<Category>>(
            future: CategoryApi().getAll(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                default:
                  if (snapshot.hasError) {
                    return ErrorConnection(message: "${snapshot.error}");
                  } else {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 170,
                        mainAxisExtent: 180,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext ctx, index) {
                        // Color color = Color((Random().nextDouble() * 0xFFDE598).toInt());
                        return InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CategoryProducts(
                                categoryName: snapshot.data![index].name,
                              ),
                            ),
                          ),
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 30),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                alignment: const Alignment(0, -0.5),
                                image:
                                    NetworkImage(snapshot.data![index].image),
                                scale: 4,
                              ),
                              color: const Color.fromRGBO(83, 177, 117, 0.1),
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: const Color.fromRGBO(83, 177, 117, 0.7),
                              ),
                            ),
                            child: Text(
                              snapshot.data![index].name,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              softWrap: true,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontSize: 16),
                            ),
                          ),
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
