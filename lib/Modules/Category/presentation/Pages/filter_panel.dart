import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar_mac/App/Services/services_locator.dart';

import 'package:nectar_mac/views/Utils/constant.dart';
import 'package:nectar_mac/views/Utils/loading_widget.dart';
import 'package:nectar_mac/views/widgets/Buttons/main_button.dart';
import 'package:nectar_mac/views/widgets/Utils/error_widget.dart';

import '../Bloc/Brands/brands_bloc.dart';
import '../Bloc/Category/category_bloc.dart';

class Filter extends StatelessWidget {
  const Filter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Filters",
          style:
              Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 16),
        ),
        leading: Icon(
          Icons.close,
          size: 20,
          color: Theme.of(context).primaryColorDark,
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => sl<BrandBloc>()
              ..add(
                GetBrandsEvent(),
              ),
          ),
          BlocProvider(
            create: (_) => sl<CategoryBloc>()
              ..add(
                GetCategoriesEvent(),
              ),
          ),
        ],
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: size.height - 100,
            decoration: BoxDecoration(
              color: Theme.of(context).hintColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        "Categories",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 24),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                //
                SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: BlocBuilder<CategoryBloc, CategoryState>(
                    // buildWhen: (previous, current) =>
                    //     previous.DepartmentState != current.DepartmentState,
                    builder: (context, state) {
                      if (state is LoadingCategoriesState) {
                        return const LoadingWidget();
                      } else if (state is LoadedCategoriesState) {
                        return RefreshIndicator(
                          onRefresh: () async =>
                              BlocProvider.of<CategoryBloc>(context)
                                  .add(RefreshCategoriesEvent()),
                          child: ListView.builder(
                            itemCount: state.categories.length,
                            itemBuilder: (context, index) => CheckboxListTile(
                              title: Text(
                                state.categories[index].name,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(fontSize: 16),
                              ),
                              value: index == 0,
                              onChanged: (bool? value) {},
                              controlAffinity: ListTileControlAffinity.leading,
                              activeColor: Theme.of(context).primaryColor,
                            ),
                          ),
                        );
                      } else if (state is ErrorCategoriesState) {
                        return ErrorConnection(message: state.message);
                      }
                      return const LoadingWidget();
                    },
                  ),
                ),
                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        "Brand",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 24),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: BlocBuilder<BrandBloc, BrandsState>(
                    // buildWhen: (previous, current) =>
                    //     previous.DepartmentState != current.DepartmentState,
                    builder: (context, state) {
                      if (state is LoadingBrandsState) {
                        return const LoadingWidget();
                      } else if (state is LoadedBrandsState) {
                        return RefreshIndicator(
                          onRefresh: () async =>
                              BlocProvider.of<BrandBloc>(context)
                                  .add(RefreshBrandsEvent()),
                          child: ListView.builder(
                            itemCount: state.brands.length,
                            itemBuilder: (context, index) => CheckboxListTile(
                              title: Text(
                                state.brands[index].name,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(fontSize: 16),
                              ),
                              value: index == 0,
                              onChanged: (bool? value) {},
                              controlAffinity: ListTileControlAffinity.leading,
                              activeColor: Theme.of(context).primaryColor,
                            ),
                          ),
                        );
                      } else if (state is ErrorBrandsState) {
                        return ErrorConnection(message: state.message);
                      }
                      return const LoadingWidget();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: const Padding(
        padding: UtilsWidget.edgeInsetsV30,
        child: MainButton(
          title: "Apply Filter",
        ),
      ),
    );
  }
}
