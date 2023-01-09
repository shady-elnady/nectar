import 'package:flutter/material.dart';

class SliderItem extends StatefulWidget {
  final String img;
  final String name;
  final double price;
  final double amount;
  final double width;
  final double height;
  final String currency;

  const SliderItem({
    super.key,
    this.width = 175,
    this.height = 250,
    required this.img,
    required this.name,
    required this.price,
    required this.amount,
    required this.currency,
  });

  @override
  State<SliderItem> createState() => _SliderItemState();
}

class _SliderItemState extends State<SliderItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
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
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset(
              widget.img,
              fit: BoxFit.cover,
            ),
          ),
          Text(widget.name),
        ],
      ),
    );
  }
}
