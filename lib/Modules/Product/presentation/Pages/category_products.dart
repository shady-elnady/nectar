import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar_mac/App/Services/services_locator.dart';

import 'package:nectar_mac/Modules/Product/presentation/Pages/Components/slider_product_item.dart';
import 'package:nectar_mac/views/Utils/loading_widget.dart';
import 'package:nectar_mac/views/widgets/index.dart';

import '../../../../../views/widgets/Utils/error_widget.dart';
import '../Bloc/searched_products_bloc/searched_products_bloc.dart';

class CategoryProducts extends StatefulWidget {
  const CategoryProducts({
    super.key,
    this.categoryName = "Beverages",
  });
  final String categoryName;

  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.categoryName,
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
      body: BlocProvider(
        create: (BuildContext context) => sl<SearchedProductBloc>()
          ..add(
            GetSearchedProductsByCategoryEvent(searchWord: widget.categoryName),
          ),
        child: SafeArea(
          child: Padding(
            padding: UtilsWidget.edgeInsetsVH20,
            child: BlocBuilder<SearchedProductBloc, SearchedProductState>(
              // buildWhen: (previous, current) =>
              //     previous.DepartmentState != current.DepartmentState,
              builder: (context, state) {
                if (state is LoadingSearchedProductsState) {
                  return const LoadingWidget();
                } else if (state is LoadedSearchedProductsByCategoryState) {
                  return RefreshIndicator(
                    onRefresh: () async =>
                        BlocProvider.of<SearchedProductBloc>(context).add(
                      RefreshSearchedProductsByCategoryEvent(
                        searchWord: widget.categoryName,
                      ),
                    ),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 175,
                        mainAxisExtent: 250,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                      ),
                      itemCount: state.searchedProducts.length,
                      itemBuilder: (BuildContext context, index) =>
                          SliderProductItem(
                        product: state.searchedProducts[index],
                        heroTag: widget.categoryName,
                      ),
                    ),
                  );
                } else if (state is ErrorSearchedProductsState) {
                  return ErrorConnection(message: state.message);
                }
                return const LoadingWidget();
              },
            ),
          ),
        ),
      ),
    );
  }
}
