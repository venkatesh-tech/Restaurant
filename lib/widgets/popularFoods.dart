import 'package:flutter/material.dart';
import 'package:restaurant/values/values.dart';

class PopularFoodWidget extends StatefulWidget {
  const PopularFoodWidget({Key? key}) : super(key: key);

  @override
  _PopularFoodWidgetState createState() => _PopularFoodWidgetState();
}

class _PopularFoodWidgetState extends State<PopularFoodWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            image: DecorationImage(
                image: AssetImage(ImagePath.chineseImg), fit: BoxFit.cover),
          ),
          alignment: Alignment.center,
          width: Sizes.WIDTH_300,
          height: Sizes.HEIGHT_240,
          margin: const EdgeInsets.symmetric(horizontal: Sizes.SIZE_12),
        ),
        SizedBox(
          height: Sizes.SIZE_12,
        ),
        Text(StringConstant.POPULAR_FOOD),
      ],
    ));
  }
}
