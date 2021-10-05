import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant/animations/scaleRoute.dart';
import 'package:restaurant/pages/cartPage.dart';
import 'package:restaurant/values/values.dart';
import 'package:restaurant/widgets/ProductImagesList.dart';
import 'package:restaurant/widgets/bottomNavigationBar.dart';
import 'package:restaurant/widgets/spaces.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              backgroundColor: AppColorsConst.whiteShade_50,
              elevation: 0.0,
              leading: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    FontAwesomeIcons.arrowLeft,
                    color: AppColorsConst.black,
                  )),
              title: Text(
                StringConstant.PRODUCT_DETAILS,
                // {$product_name},
                style: TextStyle(color: AppColorsConst.black),
              ),
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                    onPressed: () =>
                        Navigator.push(context, ScaleRoute(CartPage())),
                    icon: Icon(
                      FontAwesomeIcons.shoppingBag,
                      color: AppColorsConst.black,
                    ))
              ]),
          body: Container(
            padding: EdgeInsets.only(
                left: Sizes.PADDING_16, right: Sizes.PADDING_16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ProductImagesListWidget(
                  imageSlider_1: ImagePath.bakeryImg,
                  imageSlider_2: ImagePath.vegImg,
                  imageSlider_3: ImagePath.houseImg,
                  imageSlider_4: ImagePath.chineseImg,
                  imageSlider_5: ImagePath.foodImg,
                ),
                SpacesHeight16(),
                ProductTitleWidget(
                  productName: "Chicken Tandoori",
                  productPrice: "INR 355",
                  productSeller: "BarbeQue",
                  productDesc: "BarbeQue provides exquisite products always",
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomBarNavigation(),
        ));
  }
}

class ProductTitleWidget extends StatelessWidget {
  String productName;
  String productPrice;
  String productSeller;
  String productDesc;
  ProductTitleWidget(
      {Key? key,
      required this.productName,
      required this.productPrice,
      required this.productSeller,
      required this.productDesc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              this.productName,
              style: TextStyle(
                  color: AppColorsConst.black, fontSize: Sizes.TEXT_SIZE_20),
            ),
            Text(
              'Seller: ' + this.productSeller,
              style: TextStyle(
                  color: AppColorsConst.black,
                  fontSize: Sizes.TEXT_SIZE_16,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
        SpacesHeight8(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              this.productPrice,
              style: TextStyle(
                  color: AppColorsConst.black,
                  fontSize: Sizes.TEXT_SIZE_28,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        SpacesHeight8(),
        Text('Product Description: '),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              this.productDesc,
              style: TextStyle(
                  color: AppColorsConst.grey,
                  fontSize: Sizes.TEXT_SIZE_14,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ],
    );
  }
}
