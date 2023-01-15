import 'package:flutter/material.dart';
import 'package:nectar_mac/config/app_images.dart';

class CaurselSlider extends StatefulWidget {
  const CaurselSlider({
    super.key,
    this.images = const [
      AppImages.coursal,
      AppImages.banana,
      AppImages.beef,
    ],
    this.width = double.infinity,
    this.height = 340,
  });
  final List<String> images;
  final double width, height;
  @override
  State<CaurselSlider> createState() => _CaurselSliderState();
}

class _CaurselSliderState extends State<CaurselSlider> {
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: const EdgeInsets.only(bottom: 30, top: 0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Theme.of(context).primaryColorDark,
                    size: 25,
                  ),
                ),
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
          ),
          PageView(
            controller: _controller,
            onPageChanged: (value) => setState(() {
              index = value;
            }),
            children: [
              ...widget.images.map(
                (img) => Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Image.asset(
                    img,
                    width: widget.width,
                    height: widget.height - 60,
                    fit: BoxFit.none,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                ...widget.images
                    .asMap()
                    .entries
                    .map(
                      (e) => Container(
                        margin: const EdgeInsets.all(2),
                        width: e.key == index ? 20 : 4,
                        height: 4,
                        decoration: BoxDecoration(
                          color: e.key == index
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorLight,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
