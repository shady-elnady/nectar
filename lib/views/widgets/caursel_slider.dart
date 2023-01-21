import 'package:flutter/material.dart';

class CaurselSlider extends StatefulWidget {
  const CaurselSlider({
    super.key,
    this.images,
    this.width = double.infinity,
    this.height = 300,
    this.fromAssets = true,
  });
  final List<String>? images;
  final double width, height;
  final bool fromAssets;
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
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (value) => setState(() {
              index = value;
            }),
            children: widget.images!
                .map(
                  (img) => Container(
                    width: widget.width,
                    height: widget.height,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: widget.fromAssets
                          ? Colors.grey.shade200
                          : Colors.transparent,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    child: widget.fromAssets
                        ? Image.network(img)
                        : Image.asset(img, fit: BoxFit.cover),
                  ),
                )
                .toList(),
          ),
          Align(
            alignment: const Alignment(0, 0.85),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: widget.images!
                  .asMap()
                  .entries
                  .map(
                    (e) => Container(
                      margin: const EdgeInsets.all(4),
                      width: e.key == index ? 18 : 4,
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
            ),
          ),
        ],
      ),
    );
  }
}
