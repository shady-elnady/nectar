import 'package:flutter/material.dart';

import 'package:nectar_mac/data/Models/product.dart';
import 'package:nectar_mac/themes/app_fonts.dart';

import '../../screens/product/product_details.dart';

class SliderProductItem extends StatelessWidget {
  const SliderProductItem({
    super.key,
    required this.product,
    this.width = 175,
    this.height = 250,
    required this.heroTag,
  });
  final Product product;
  final double width;
  final double height;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Theme.of(context).primaryColorLight,
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Hero(
                tag: "$heroTag-${product.name}",
                child: Image.network(
                  product.image,
                  alignment: Alignment.center,
                  width: 120,
                  height: 110,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          RichText(
            text: TextSpan(
              text: product.name,
              style: TextStyle(
                fontFamily: AppFonts.gilroy,
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColorDark,
              ),
              children: <TextSpan>[
                TextSpan(
                  text:
                      '\n${product.amount.toInt()}${product.unit!.symbol}, Priceg',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).primaryColorLight,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${product.currency.code}${product.price}",
                style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: AppFonts.gilroy,
                ),
              ),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: Theme.of(context).primaryColor,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetail(
                          product: product,
                          heroTag: "$heroTag-${product.name}",
                        ),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.add,
                    color: Theme.of(context).canvasColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
