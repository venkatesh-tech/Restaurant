import 'package:flutter/material.dart';
import 'package:restaurant/values/values.dart';

class BellyButton extends StatelessWidget {
  final String label;
  final double width;
  final double height;
  BoxDecoration decoration;
  final GestureTapCallback onTap;
  final TextStyle buttonStyle;

  BellyButton(
    this.label,
    this.onTap, {
    this.width = Sizes.WIDTH_300,
    this.height = Sizes.HEIGHT_60,
    this.buttonStyle =
        const TextStyle(color: Colors.black, fontSize: Sizes.TEXT_SIZE_20),
    this.decoration = const BoxDecoration(
      color: Colors.redAccent,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          height: height,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(label, textAlign: TextAlign.center, style: buttonStyle)
            ],
          ),
        ),
    );
  }
}
