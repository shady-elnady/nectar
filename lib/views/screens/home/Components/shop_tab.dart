import 'package:flutter/material.dart';

import 'package:banner_carousel/banner_carousel.dart';

import '../../../../config/index.dart';

class ShopTab extends StatefulWidget {
  const ShopTab({super.key});

  @override
  State<ShopTab> createState() => _ShopTabState();
}

class _ShopTabState extends State<ShopTab> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int intialBannerCarousel = 0;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 23,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.carot,
              width: 27,
            ),
            Image.asset(
              AppImages.dhaka,
              width: size.width / 2.4,
              // height: 22,
            ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 2,
                vertical: 20,
              ),
              child: TextField(
                style: Theme.of(context).dropdownMenuTheme.textStyle,
                cursorHeight: 25,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  fillColor: Theme.of(context).dialogBackgroundColor,
                  filled: true,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  hintText: 'Search Store',
                  hintStyle: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            ),
            // Carousel Customized
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
              onTap: (id) => intialBannerCarousel = int.parse(id),
              onPageChanged: (id) => intialBannerCarousel = id,
              width: size.width,
              indicatorBottom: false,
              margin: const EdgeInsets.all(0),
              initialPage: intialBannerCarousel,
            ),
            //
          ],
        ),
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
