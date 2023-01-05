import 'package:flutter/material.dart';

import 'dart:math' as math;

class CustomTextField extends StatefulWidget {
  final String label, hint;
  final Icon? icon;
  final FocusNode? foucNode;
  const CustomTextField({
    super.key,
    this.label = "Email",
    this.hint = "imshuvo97@gmail.com",
    this.icon,
    this.foucNode,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Theme.of(context).inputDecorationTheme.labelStyle,
        ),
        TextField(
          focusNode: widget.foucNode,
          autofocus: widget.foucNode != null,
          style: Theme.of(context).inputDecorationTheme.hintStyle,
          obscureText: widget.label != "Password" ? false : !_passwordVisible,
          decoration: InputDecoration(
            suffixIcon: widget.icon ??
                (widget.label != "Password"
                    ? null
                    : IconButton(
                        icon: widget.icon ??
                            Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationX(math.pi),
                              child: Icon(
                                // Based on passwordVisible state choose the icon
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                // color: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      )),
            hintText: widget.label == "Password" ? "........" : widget.hint,
            hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
          ),
        ),
      ],
    );
  }
}
