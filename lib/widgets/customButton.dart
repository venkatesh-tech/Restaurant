import 'package:flutter/material.dart';
import 'package:restaurant/animations/scaleRoute.dart';
import 'package:restaurant/values/values.dart';

class CustomButton extends StatefulWidget {
  String label;
  double width;
  double height;
  Color color;
  Function onTap;
  Widget onPress;
  Widget prefixIcon;
  double iconGap;

  CustomButton(this.label, this.onPress, this.onTap, this.color, this.width,
      this.height, this.prefixIcon, this.iconGap);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context, ScaleRoute(widget.onPress));
        },
        child: Container(
            width: widget.width,
            height: widget.height,
            color: widget.color,
            // color: widget.color ?? AppColorsConst.green,
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.prefixIcon,
                // widget.prefixIcon != null
                //     ? widget.prefixIcon
                //     : SizedBox.shrink(),
                SizedBox(width: widget.iconGap),
                Text(
                  widget.label,
                  style: TextStyle(
                      fontSize: Sizes.TEXT_SIZE_16,
                      color: AppColorsConst.white,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold),
                )
              ],
            )));
  }
}
