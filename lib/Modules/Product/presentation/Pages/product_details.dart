import 'package:flutter/material.dart';

import 'package:nectar_mac/views/widgets/caursel_slider.dart';
import 'package:nectar_mac/views/widgets/index.dart';

import '../../domain/Entities/product.dart';
import '../../domain/Entities/product_image.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({
    super.key,
    required this.product,
    required this.heroTag,
  });
  final Product product;
  final String heroTag;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int amount = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).primaryColorDark,
            size: 25,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_upward_rounded,
              color: Theme.of(context).primaryColorDark,
              size: 25,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: widget.heroTag,
              child: CaurselSlider(
                images: [
                  widget.product.image,
                  ...widget.product.productImages!
                      .map((ProductImage pImg) => pImg.image)
                      .toList(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text: widget.product.name,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 24),
                      children: [
                        TextSpan(
                          text:
                              "\n${widget.product.amount.toInt()}${widget.product.unit!.symbol}, Price",
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
              padding: const EdgeInsets.fromLTRB(5, 20, 25, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () =>
                            amount > 1 ? setState(() => amount--) : null,
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
                          "$amount",
                          style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).primaryColorDark,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () => setState(() {
                          amount++;
                        }),
                        child: Icon(
                          Icons.add,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "${widget.product.currency.code}${widget.product.price}",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            //
            // UtilsWidget.divider,
            //
            ExpansionTile(
              initiallyExpanded: true,
              childrenPadding: const EdgeInsets.fromLTRB(25, 0, 15, 25),
              tilePadding: const EdgeInsets.symmetric(horizontal: 25),
              title: Text(
                "Product Detail",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: 17, fontWeight: FontWeight.w800),
              ),
              children: [
                Text(
                  widget.product.detail ??
                      "Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 13),
                ),
              ],
            ),
            ExpansionTile(
              childrenPadding: const EdgeInsets.fromLTRB(25, 0, 15, 25),
              tilePadding: const EdgeInsets.symmetric(horizontal: 25),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Nutritions",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 17, fontWeight: FontWeight.w800),
                  ),
                  Container(
                    width: 40,
                    height: 20,
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
              trailing: const Icon(Icons.arrow_forward_ios, size: 20),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Review",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 17, fontWeight: FontWeight.w800),
                  ),
                  Row(
                    children: [
                      // Add Star Loop
                      ...List.generate(
                        widget.product.reviews!.toInt(),
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
            const Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: MainButton(
                title: "Add To Basket",
              ),
            )
          ],
        ),
      ),
    );
  }
}
