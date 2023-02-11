import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar_mac/views/Utils/loading_widget.dart';

import 'package:nectar_mac/views/widgets/Utils/error_widget.dart';
import 'package:nectar_mac/views/widgets/index.dart';
import 'package:nectar_mac/views/widgets/textFields/search_field.dart';

import '../Bloc/category_bloc.dart';
import '../../../Product/presentation/Pages/category_products.dart';

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
          child: BlocBuilder<CategoryBloc, CategoryState>(
            // buildWhen: (previous, current) =>
            //     previous.DepartmentState != current.DepartmentState,
            builder: (context, state) {
              if (state is LoadingCategoriesState) {
                return const LoadingWidget();
              } else if (state is LoadedCategoriesState) {
                return RefreshIndicator(
                  onRefresh: () async => BlocProvider.of<CategoryBloc>(context)
                      .add(RefreshCategoriesEvent()),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 170,
                      mainAxisExtent: 180,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemCount: state.categories.length,
                    itemBuilder: (BuildContext ctx, index) {
                      // Color color = Color((Random().nextDouble() * 0xFFDE598).toInt());
                      return InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => CategoryProducts(
                              categoryName: state.categories[index].name,
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
                                  NetworkImage(state.categories[index].image),
                              scale: 4,
                            ),
                            color: const Color.fromRGBO(83, 177, 117, 0.1),
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: const Color.fromRGBO(83, 177, 117, 0.7),
                            ),
                          ),
                          child: Text(
                            state.categories[index].name,
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
                  ),
                );
              } else if (state is ErrorCategoriesState) {
                return ErrorConnection(message: state.message);
              }
              return const LoadingWidget();
            },
          ),
        ),
      ),
    );
  }
}
