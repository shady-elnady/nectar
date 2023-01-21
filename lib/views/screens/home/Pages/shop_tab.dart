import 'package:flutter/material.dart';
import 'package:nectar_mac/config/index.dart';
import 'package:nectar_mac/data/Models/department.dart';
import 'package:nectar_mac/data/Models/product.dart';
import 'package:nectar_mac/data/Providers/department_provider.dart';
import 'package:nectar_mac/data/Providers/product_provider.dart';
import 'package:nectar_mac/views/Utils/constant.dart';
import 'package:nectar_mac/views/widgets/Utils/slider_product_item.dart';

import '../../../widgets/Utils/error_widget.dart';
import '../../../widgets/caursel_slider.dart';
import '../../category/categories.dart';
import 'Components/search_card.dart';
import 'Components/trend_section.dart';

class ShopTab extends StatelessWidget {
  const ShopTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSearchBar(context),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 0),
        child: ListView(
          children: const <Widget>[
            CaurselSlider(
              height: 115,
              fromAssets: false,
              images: [
                AppImages.carouselImage1,
                AppImages.carouselImage2,
                AppImages.carouselImage3,
              ],
            ),
            DepartmentsList(),
            //
            UtilsWidget.sizedBox15,
            DepartmentTitle(
              title: "Groceries",
            ),
            Groceries(),
          ],
        ),
      ),
    );
  }

  buildSearchBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height / 5.5,
      ),
      child: SearchCard(),
    );
  }
}

class DepartmentsList extends StatelessWidget {
  const DepartmentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Department>>(
      future: DepartmentApi().getAll(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          default:
            if (snapshot.hasError) {
              return ErrorConnection(message: "${snapshot.error}");
            } else {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...snapshot.data.map(
                    (Department department) => DepartmentContainer(
                      department: department,
                    ),
                  ),
                ],
              );
            }
        }
      },
    );
  }
}

class DepartmentContainer extends StatelessWidget {
  const DepartmentContainer({
    super.key,
    required this.department,
  });
  final Department department;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: DepartmentTitle(title: department.name),
        ),
        //
        // Loop For Department Products
        SizedBox(
          height: 250,
          width: double.infinity,
          child: ListView.builder(
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            // ignore: unnecessary_null_comparison
            itemCount: department.products?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: SliderProductItem(
                  product: department.products![index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class DepartmentTitle extends StatelessWidget {
  const DepartmentTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontSize: 26.0,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
        TextButton(
          child: InkWell(
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Categories(),
              ),
            ),
            child: Text(
              "See all",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const TrendSection();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

class Groceries extends StatelessWidget {
  const Groceries({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: ProductApi().getAll(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          default:
            if (snapshot.hasError) {
              return ErrorConnection(message: "${snapshot.error}");
            } else {
              List<Product> products = snapshot.data;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //
                  SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: ListView(
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        ...products.map(
                          (Product product) => Container(
                            alignment: Alignment.centerLeft,
                            height: 150,
                            width: 250,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            margin: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 20,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(248, 164, 76, 0.15),
                              borderRadius: BorderRadius.circular(18),
                              // border: Border.all(
                              //   color: Colors.transparent,
                              //   width: 1,
                              //   style: BorderStyle.solid,
                              // ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  product.category!.image,
                                  width: 80,
                                  height: 80,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    product.category!.name,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Theme.of(context).primaryColorDark,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //
                  SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: SliderProductItem(
                            product: products[index],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
        }
      },
    );
  }
}
