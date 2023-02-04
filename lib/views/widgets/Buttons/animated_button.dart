import 'package:flutter/material.dart';
import 'package:nectar_mac/Modules/log/presentation/Pages/auth/sing_in_screen.dart';

class AnimatedTransButton extends StatefulWidget {
  final String? routeName;
  final bool start;
  const AnimatedTransButton({
    Key? key,
    this.routeName,
    required this.start,
  }) : super(key: key);

  @override
  State<AnimatedTransButton> createState() => _AnimatedTransButtonState();
}

class _AnimatedTransButtonState extends State<AnimatedTransButton>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _scale2Controller;
  late AnimationController _widthController;
  late AnimationController _positionController;

  late Animation<double> _scaleAnimation;
  late Animation<double> _scale2Animation;
  late Animation<double> _widthAnimation;
  late Animation<double> _positionAnimation;

  bool hideIcon = true;
  bool waiting = true;

  @override
  void initState() {
    super.initState();

    _scaleController = _controller(time: 400);
    _widthController = _controller(time: 600);
    _positionController = _controller(time: 1000);
    _scale2Controller = _controller();

    _scaleAnimation = animation(
      begin: 1.0,
      end: 0.8,
      firstController: _scaleController,
      secondController: _widthController,
    );

    _widthAnimation = animation(
      begin: 80.0,
      end: 300,
      firstController: _widthController,
      secondController: _positionController,
    );

    _positionAnimation = animation(
      begin: 0,
      end: 215,
      firstController: _positionController,
      secondController: _scale2Controller,
    );

    _scale2Animation = animation(
      begin: 1.0,
      end: 40.0,
      firstController: _scale2Controller,
      route: true,
    );
  }

  // @override
  // void dispose() {
  //   _scaleController.dispose();
  //   _scale2Controller.dispose();
  //   _widthController.dispose();
  //   _positionController.dispose();
  //   super.dispose();
  // }

  //
  AnimationController _controller({int time = 150}) => AnimationController(
        vsync: this,
        duration: Duration(milliseconds: time),
      );
  //

  Animation<double> animation({
    double? begin,
    double? end,
    AnimationController? firstController,
    AnimationController? secondController,
    bool? route = false,
  }) =>
      Tween<double>(begin: begin, end: end).animate(firstController!)
        ..addStatusListener(
          (status) async {
            if (status == AnimationStatus.completed) {
              if (!route!) {
                firstController.dispose();
                await secondController!.forward();
              } else {
                firstController.dispose();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SingInScreen(),
                  ),
                );
              }
            }
          },
        );

  void _playAnimation() async {
    try {
      await _scaleController.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  //
  @override
  Widget build(BuildContext context) {
    if (widget.start) {
      setState(() {
        waiting = false;
      });
      _playAnimation();
    }
    return AnimatedBuilder(
      animation: _scaleController,
      builder: (context, child) => Transform.scale(
        scale: _scaleAnimation.value,
        child: Center(
          child: AnimatedBuilder(
            animation: _widthController,
            builder: (context, child) => Container(
              width: _widthAnimation.value,
              height: 80,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Theme.of(context).primaryColor,
              ),
              child: InkWell(
                onTap: () async {
                  setState(() {
                    waiting = true;
                  });
                  if (widget.start) {
                    setState(() {
                      waiting = false;
                    });
                    _playAnimation();
                  } else {
                    setState(() {
                      waiting = false;
                    });
                  }
                },
                child: Stack(
                  children: <Widget>[
                    AnimatedBuilder(
                      animation: _positionController,
                      builder: (context, child) => Positioned(
                        left: _positionAnimation.value,
                        child: AnimatedBuilder(
                          animation: _scale2Controller,
                          builder: (context, child) => Transform.scale(
                            scale: _scale2Animation.value,
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).primaryColor,
                              ),
                              child: hideIcon
                                  ? waiting
                                      ? Icon(
                                          Icons.arrow_forward_ios,
                                          color: Theme.of(context).canvasColor,
                                        )
                                      : CircularProgressIndicator(
                                          color: Theme.of(context).canvasColor,
                                        )
                                  : Container(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
