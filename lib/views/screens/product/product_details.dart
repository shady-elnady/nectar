import 'package:flutter/material.dart';

import 'package:nectar_mac/data/Models/product.dart';
import 'package:nectar_mac/views/widgets/caursel_slider.dart';
import 'package:nectar_mac/views/widgets/index.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({
    super.key,
    required this.product,
  });
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // //
            // BannerCarousel(
            //   banners: [
            //     BannerModel(
            //       imagePath: AppImages.coursal,
            //       id: "1",
            //       boxFit: BoxFit.contain,
            //     ),
            //     BannerModel(
            //       imagePath: AppImages.banana,
            //       id: "2",
            //       boxFit: BoxFit.contain,
            //     ),
            //     BannerModel(
            //       imagePath: AppImages.apple,
            //       id: "3",
            //       boxFit: BoxFit.contain,
            //     ),
            //   ],
            //   customizedIndicators: const IndicatorModel.animation(
            //     width: 5,
            //     height: 5,
            //     spaceBetween: 2.5,
            //     widthAnimation: 17,
            //   ),
            //   // width: double.infinity,
            //   height: 340,
            //   activeColor: Theme.of(context).primaryColor,
            //   disableColor: Theme.of(context).dialogBackgroundColor,
            //   animation: true,
            //   borderRadius: 35,
            //   indicatorBottom: false,
            //   margin: const EdgeInsets.all(0),
            // ),
            // //
            const CaurselSlider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text: "Naturel Red Apple",
                      style: Theme.of(context).textTheme.titleLarge,
                      children: [
                        TextSpan(
                          text: "\n1kg, Price",
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                      size: 30,
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ),
                ],
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 20, 25, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: Theme.of(context).textButtonTheme.style,
                        child: const Icon(Icons.remove),
                      ),
                      Container(
                        width: 45,
                        height: 45,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: Theme.of(context).primaryColorLight,
                          ),
                        ),
                        child: Text(
                          "1",
                          style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).primaryColorDark,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      TextButton(
                        autofocus: true,
                        onPressed: () {},
                        style: ButtonStyle(
                          iconColor: MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.focused)) {
                                return Theme.of(context).primaryColor;
                              }
                              // Use the component's default.
                              return Theme.of(context).primaryColorLight;
                            },
                          ),
                        ),
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                  Text(
                    "\$4.99",
                    style: TextStyle(
                      fontSize: 24,
                      color: Theme.of(context).primaryColorDark,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            //
            // UtilsWidget.divider,
            //
            ExpansionTile(
              childrenPadding: const EdgeInsets.fromLTRB(25, 0, 15, 25),
              tilePadding: const EdgeInsets.symmetric(horizontal: 25),
              title: Text(
                "Product Detail",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              children: [
                Text(
                  "Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            ExpansionTile(
              childrenPadding: const EdgeInsets.fromLTRB(25, 0, 15, 25),
              tilePadding: const EdgeInsets.symmetric(horizontal: 25),
              trailing: const Icon(Icons.arrow_forward_ios),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Nutritions",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Container(
                    width: 50,
                    height: 25,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFFEBEBEB),
                    ),
                    child: Text(
                      "100gr",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
            ExpansionTile(
              childrenPadding: const EdgeInsets.fromLTRB(25, 0, 25, 15),
              tilePadding: const EdgeInsets.symmetric(horizontal: 25),
              iconColor: Theme.of(context).primaryColorDark,
              trailing: const Icon(Icons.arrow_forward_ios),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Review",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Row(
                    children: [
                      // Add Star Loop
                      ...List.generate(
                        5,
                        (index) => const Icon(
                          Icons.star,
                          size: 15,
                          color: Color(0xFFF3603F),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const MainButton(
              title: "Add To Basket",
            )
          ],
        ),
      ),
    );
  }
}
