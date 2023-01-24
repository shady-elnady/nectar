import 'package:flutter/material.dart';
import 'package:nectar_mac/views/Utils/constant.dart';

import '../../../data/Models/brand.dart';
import '../../../data/Models/category.dart';
import '../../../data/Providers/brand_provider.dart';
import '../../../data/Providers/category_provider.dart';
import '../../widgets/Buttons/main_button.dart';
import '../../widgets/Utils/error_widget.dart';

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
      body: SafeArea(
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
                child: FutureBuilder<List<Category?>>(
                  future: CategoryApi().getAll(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Category?>> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return const Center(child: CircularProgressIndicator());
                      default:
                        if (snapshot.hasError) {
                          return ErrorConnection(message: "${snapshot.error}");
                        } else {
                          return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) => CheckboxListTile(
                              title: Text(
                                snapshot.data![index]!.name,
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
                          );
                        }
                    }
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
              //
              SizedBox(
                width: double.infinity,
                height: 150,
                child: FutureBuilder<List<Brand?>>(
                  future: BrandApi().getAll(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Brand?>> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return const Center(child: CircularProgressIndicator());
                      default:
                        if (snapshot.hasError) {
                          return ErrorConnection(message: "${snapshot.error}");
                        } else {
                          return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) => CheckboxListTile(
                              title: Text(
                                snapshot.data![index]!.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(fontSize: 16),
                              ),
                              value: index == 1,
                              onChanged: (bool? value) {},
                              controlAffinity: ListTileControlAffinity.leading,
                              activeColor: Theme.of(context).primaryColor,
                            ),
                          );
                        }
                    }
                  },
                ),
              ),
              //
            ],
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
