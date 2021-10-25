import 'package:flutter/material.dart';
import 'package:restaurant/animations/scaleRoute.dart';
import 'package:restaurant/pages/cartPage.dart';
import 'package:restaurant/values/values.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.remove),
            color: AppColorsConst.black,
            iconSize: Sizes.SIZE_24,
          ),
          InkWell(
            onTap: () => Navigator.push(context, ScaleRoute(CartPage())),
            child: Container(
              height: Sizes.HEIGHT_48,
              width: Sizes.WIDTH_200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.RADIUS_12),
                  color: Colors.redAccent,
                  border:
                      Border.all(width: Sizes.WIDTH_1, color: Colors.white)),
              child: Center(
                child: Text(
                  StringConstant.ADD_TO_CART,
                  style: TextStyle(
                      fontSize: Sizes.TEXT_SIZE_22,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
            color: AppColorsConst.black,
            iconSize: Sizes.SIZE_24,
          ),
        ],
      ),
    );
  }
}
