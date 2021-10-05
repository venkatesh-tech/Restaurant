import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:restaurant/values/values.dart';

class ProductImagesListWidget extends StatelessWidget {
  String imageSlider_1;
  String imageSlider_2;
  String imageSlider_3;
  String imageSlider_4;
  String imageSlider_5;

  ProductImagesListWidget({
    Key? key,
    required this.imageSlider_1,
    required this.imageSlider_2,
    required this.imageSlider_3,
    required this.imageSlider_4,
    required this.imageSlider_5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: Sizes.PADDING_12, right: Sizes.PADDING_12),
      child: Container(
        height: Sizes.HEIGHT_150,
        child: Carousel(
          boxFit: BoxFit.fill,
          images: [
            // AssetImage(ImagePath.houseImg),
            // AssetImage(ImagePath.vegImg),
            // AssetImage(ImagePath.bakeryImg),
            // AssetImage(ImagePath.foodImg)
            Image.asset(imageSlider_1),
            Image.asset(imageSlider_2),
            Image.asset(imageSlider_3),
            Image.asset(imageSlider_4),
            Image.asset(imageSlider_4),
          ],
          animationDuration: Duration(milliseconds: 2000),
          autoplay: true,
          animationCurve: Curves.fastOutSlowIn,
          dotSize: Sizes.SIZE_4,
          dotSpacing: Sizes.SIZE_16,
          dotColor: Colors.redAccent,
          indicatorBgPadding: Sizes.SIZE_6,
          dotBgColor: Colors.transparent,
          borderRadius: true,
          radius: Radius.circular(Sizes.RADIUS_24),
        ),
      ),
    );
  }
}
