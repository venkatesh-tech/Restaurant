import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant/animations/scaleRoute.dart';
import 'package:restaurant/pages/cartPage.dart';
import 'package:restaurant/values/values.dart';
import 'package:restaurant/widgets/ProductImagesList.dart';
import 'package:restaurant/widgets/bottomNavigationBar.dart';
// import 'package:restaurant/widgets/customButton.dart';
import 'package:restaurant/widgets/addToCartButton.dart';
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
                SpacesHeight16(),
              ],
            ),
          ),
          bottomNavigationBar: BottomBarNavigation(),
        ),
    );
  }
}

class ProductTitleWidget extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String productSeller;
  final String productDesc;
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
        SpacesHeight16(),
        Text('Product Description: '),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: <Widget>[
        //     Text(
        //       this.productDesc,
        //       style: TextStyle(
        //           color: AppColorsConst.grey,
        //           fontSize: Sizes.TEXT_SIZE_14,
        //           fontWeight: FontWeight.w400),
        //     )
        //   ],
        // ),
        ProdcutDescriptionContext(),
        SpacesHeight16(),
        PreferredSize(
          preferredSize: Size.fromHeight(Sizes.HEIGHT_48),
          child: TabBar(
              labelColor: AppColorsConst.black,
              labelStyle: TextStyle(fontWeight: FontWeight.w600),
              indicatorColor: Colors.redAccent,
              unselectedLabelColor: AppColorsConst.grey,
              // indicatorSize: TabBarIndicatorSize.tab,
              tabs: <Widget>[
                Tab(
                  text: StringConstant.PROD_SPECS,
                ),
                Tab(
                  text: StringConstant.OEM,
                ),
              ]),
        ),
        Container(
          height: Sizes.HEIGHT_100,
          child: TabBarView(
            children: [
              Container(
                color: Colors.white,
                child: ProdcutSpecsContext(),
              ),
              Container(
                color: Colors.white,
                child: ProdcutDescriptionContext(),
              )
            ],
          ),
        ),
        SpacesHeight16(),
        AddToCartButton(),
        // CustomButton(
        //     'Add To Cart',
        //     Text('Payment'),
        //     () => Navigator.pushNamed(context, 'cart'),
        //     AppColorsConst.green,
        //     200.0,
        //     48.0,
        //     Icon(Icons.credit_card, color: Colors.white),
        //     8.0)
      ],
    );
  }
}

class ProdcutDescriptionContext extends StatelessWidget {
  const ProdcutDescriptionContext({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'ProdcutDescriptionContext india is my country all indians are my brothers and sisters....',
        style: TextStyle(
            fontSize: Sizes.TEXT_SIZE_14,
            height: 1.50,
            color: Colors.black45,
            fontWeight: FontWeight.w300),
        textAlign: TextAlign.justify,
      ),
    );
  }
}

class ProdcutSpecsContext extends StatelessWidget {
  const ProdcutSpecsContext({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Apple iPhone is not as good as Galaxy Note 20 Ultra in terms of Camera that has \nRam: 6GB',
        style: TextStyle(
            fontSize: Sizes.TEXT_SIZE_14,
            height: 1.50,
            color: Colors.black45,
            fontWeight: FontWeight.w300),
        textAlign: TextAlign.justify,
      ),
    );
  }
}

// class AddToCartButton extends StatelessWidget {
//   const AddToCartButton({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(Icons.remove),
//             color: AppColorsConst.black,
//             iconSize: Sizes.SIZE_24,
//           ),
//           InkWell(
//             onTap: () => Navigator.push(context, ScaleRoute(CartPage())),
//             child: Container(
//               height: Sizes.HEIGHT_48,
//               width: Sizes.WIDTH_200,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(Sizes.RADIUS_12),
//                   color: Colors.redAccent,
//                   border:
//                       Border.all(width: Sizes.WIDTH_1, color: Colors.white)),
//               child: Center(
//                 child: Text(
//                   StringConstant.ADD_TO_CART,
//                   style: TextStyle(
//                       fontSize: Sizes.TEXT_SIZE_22,
//                       color: Colors.white,
//                       fontWeight: FontWeight.w500),
//                 ),
//               ),
//             ),
//           ),
//           IconButton(
//             onPressed: () {},
//             icon: Icon(Icons.add),
//             color: AppColorsConst.black,
//             iconSize: Sizes.SIZE_24,
//           ),
//         ],
//       ),
//     );
//   }
// }
