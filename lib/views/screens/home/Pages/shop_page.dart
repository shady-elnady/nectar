import 'package:flutter/material.dart';
import 'package:banner_carousel/banner_carousel.dart';
import 'package:nectar_mac/config/index.dart';
import 'package:nectar_mac/views/Utils/constant.dart';

import 'Components/categories_card.dart';
import 'Components/data/categories_data.dart';
import 'Components/category_item.dart';
import 'Components/data/friends_data.dart';
import 'Components/data/departments_data.dart';
import 'Components/search_card.dart';
import 'Components/slider_item.dart';
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
            UtilsWidget.sizedBox15,
            buildDepartmentRow('Exclusive Offer', context),
            UtilsWidget.sizedBox15,
            buildDepartmentProductsList(context),
            UtilsWidget.sizedBox15,
            buildCategoryRow('Category', context),
            UtilsWidget.sizedBox15,
            buildCategoryList(context),
            UtilsWidget.sizedBox15,
            buildCategoryRow('Friends', context),
            UtilsWidget.sizedBox15,
            buildFriendsList(),
            UtilsWidget.sizedBox15,
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
        itemCount: categoriesList == null ? 0 : categoriesList.length,
        itemBuilder: (BuildContext context, int index) {
          Map cat = categoriesList[index];

          return CategoryItem(
            cat: cat,
          );
        },
      ),
    );
  }

  buildDepartmentProductsList(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 175,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        // ignore: unnecessary_null_comparison
        itemCount: departmentsList == null ? 0 : departmentsList.length,
        itemBuilder: (BuildContext context, int index) {
          Map product = departmentsList[index];

          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: SliderItem(
              img: product["img"],
              name: product["title"],
              currency: product["address"],
              price: product["rating"],
            ),
          );
        },
      ),
    );
  }

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
