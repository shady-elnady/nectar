import 'package:flutter/material.dart';
import 'package:banner_carousel/banner_carousel.dart';
import 'package:nectar_mac/config/index.dart';
import 'package:nectar_mac/data/Providers/department_provider.dart';
import 'package:nectar_mac/data/Providers/product_provider.dart';
import 'package:nectar_mac/data/index.dart';
import 'package:nectar_mac/views/Utils/constant.dart';
import 'package:nectar_mac/views/widgets/Utils/slider_product_item.dart';

import 'Components/categories_card.dart';
import 'Components/data/categories_data.dart';
import 'Components/category_item.dart';
import 'Components/data/friends_data.dart';
import 'Components/search_card.dart';
import 'Components/trend_section.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildSearchBar(context),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 0),
        child: ListView(
          children: <Widget>[
            //
            BannerCarousel(
              banners: BannerImages.listBanners,
              customizedIndicators: const IndicatorModel.animation(
                width: 5,
                height: 5,
                spaceBetween: 2.5,
                widthAnimation: 17,
              ),
              height: 115,
              activeColor: Theme.of(context).primaryColor,
              disableColor: Theme.of(context).dialogBackgroundColor,
              animation: true,
              borderRadius: 8,
              width: size.width,
              indicatorBottom: false,
              margin: const EdgeInsets.all(0),
            ),
            //
            const DepartmentsList(),
            //
            UtilsWidget.sizedBox15,
            const MainTitle(
              title: "Groceries",
            ),
            const Groceries(),
          ],
        ),
      ),
    );
  }

  buildDepartmentRow(String departmentName, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          departmentName,
          style: TextStyle(
            fontSize: 26.0,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
        TextButton(
          child: Text(
            "See all",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
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

  buildCategoryRow(String category, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          category,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        TextButton(
          child: Text(
            "See all (9)",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 15,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const CategoriesCard();
                },
              ),
            );
          },
        ),
      ],
    );
  }

  buildSearchBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height / 5.8,
      ),
      child: SearchCard(),
    );
  }

  buildCategoryList(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 6,
      child: ListView.builder(
        primary: false,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: categoriesList.length,
        itemBuilder: (BuildContext context, int index) {
          Map cat = categoriesList[index];

          return CategoryItem(
            cat: cat,
          );
        },
      ),
    );
  }

  // buildDepartmentProductsList(BuildContext context) {
  //   return SizedBox(
  //     height: 250,
  //     width: 175,
  //     child: ListView.builder(
  //       primary: false,
  //       shrinkWrap: true,
  //       scrollDirection: Axis.horizontal,
  //       // ignore: unnecessary_null_comparison
  //       itemCount: departmentsList == null ? 0 : departmentsList.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         Map product = departmentsList[index];

  //         return Padding(
  //           padding: const EdgeInsets.only(right: 10.0),
  //           child: SliderItem(
  //             img: product["img"],
  //             name: product["title"],
  //             currency: product["address"],
  //             price: product["rating"],
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  buildFriendsList() {
    return SizedBox(
      height: 50.0,
      child: ListView.builder(
        primary: false,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        // ignore: unnecessary_null_comparison
        itemCount: friendsList == null ? 0 : friendsList.length,
        itemBuilder: (BuildContext context, int index) {
          String img = friendsList[index];

          return Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                img,
              ),
              radius: 25.0,
            ),
          );
        },
      ),
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
              return Text('Error: ${snapshot.error}');
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
          child: MainTitle(title: department.name),
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

class MainTitle extends StatelessWidget {
  const MainTitle({
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
          child: Text(
            "See all",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
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

class BannerImages {
  // static const String banner1 =
  //     "https://picjumbo.com/wp-content/uploads/the-golden-gate-bridge-sunset-1080x720.jpg";
  // static const String banner2 =
  //     "https://cdn.mos.cms.futurecdn.net/Nxz3xSGwyGMaziCwiAC5WW-1024-80.jpg";
  // static const String banner3 = "https://wallpaperaccess.com/full/19921.jpg";

  static List<BannerModel> listBanners = [
    BannerModel(imagePath: AppImages.carouselImage1, id: "1"),
    BannerModel(imagePath: AppImages.carouselImage2, id: "2"),
    BannerModel(imagePath: AppImages.carouselImage3, id: "3"),
  ];
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
              return Text('Error: ${snapshot.error}');
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
