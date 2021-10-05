import 'package:flutter/material.dart';
import 'package:restaurant/values/values.dart';

class CardWidget extends StatelessWidget {
  late final String title;
  late final BoxDecoration decoration;
  final GestureTapCallback onTap;

  CardWidget(@required this.title, this.decoration, this.onTap);

  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          child: Opacity(
            opacity: 0.8,
            child: Container(
          height: Sizes.HEIGHT_100,
              width: Sizes.WIDTH_40,
              decoration: decoration,
              child: Center(
                child: Text(
                  title,
              style: TextStyle(
                      fontSize: Sizes.SIZE_24, color: AppColorsConst.black),
                ),
          ),
          ),
      ),
    ));
  }
}
