// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:restaurant/animations/scaleRoute.dart';
// import 'package:restaurant/values/values.dart';

// class CartPage extends StatefulWidget {
//   const CartPage({Key? key}) : super(key: key);

//   @override
//   _CartPageState createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//         length: 2,
//         child: Scaffold(
//           backgroundColor: Colors.white,
//           appBar: AppBar(
//               backgroundColor: AppColorsConst.whiteShade_50,
//               elevation: 0.0,
//               leading: IconButton(
//                   onPressed: () => Navigator.of(context).pop(),
//                   icon: Icon(
//                     FontAwesomeIcons.arrowLeft,
//                     color: AppColorsConst.black,
//                   )),
//               title: Text(
//                 StringConstant.CART,
//                 // {$product_name},
//                 style: TextStyle(color: AppColorsConst.black),
//               ),
//               centerTitle: true,
//               actions: <Widget>[
//                 IconButton(
//                     onPressed: () =>
//                         Navigator.push(context, ScaleRoute(CartPage())),
//                     icon: Icon(
//                       FontAwesomeIcons.shoppingBag,
//                       color: AppColorsConst.black,
//                     ))
//               ]),
//         ));
//   }
// }

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/values/values.dart';
// import 'package:restaurant/Auth/checkout_navigator.dart';
// import 'package:restaurant/Locale/locales.dart';
// import 'package:restaurant/Theme/colors.dart';

class Product {
  Product(this.img, this.name, this.category, this.price);
  String img;
  String name;
  String category;
  String price;
//  int count;
}

class CartPage extends StatefulWidget {
  // final VoidCallback onBackButtonPressed;

  CartPage();

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<int> count = [1, 1, 1];
  @override
  Widget build(BuildContext context) {
    // items => item[0].img,item[1].img, item[2].img
    List<Product> items = [
      Product(ImagePath.bakeryImg, 'lady Finger', 'Operum Market', '\$32.00'),
      Product(ImagePath.bakeryImg, 'Tomatoes', 'Calvis Veggies', '\$44.00'),
      Product(ImagePath.bakeryImg, 'Potatoes', 'Philinopis', '\$14.00'),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // widget.onBackButtonPressed();
            },
          ),
          elevation: 0,
          title: Text(
            'Your Cart',
            style: TextStyle(color: AppColorsConst.black),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true),
      body: FadedSlideAnimation(
        Stack(
          children: [
            ListView(
              physics: BouncingScrollPhysics(),
              children: [
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: items.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: FadedScaleAnimation(
                                  Image.asset(
                                    items[index].img, // list images
                                    height: 95,
                                  ),
                                )),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  items[index].name,
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  items[index].category,
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    buildIconButton(
                                        Icons.remove, index, items, count),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text('${count[index]}', // ${count[index]}
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    buildIconButton(
                                        Icons.add, index, items, count),
                                    SizedBox(
                                      width: 40,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            Text('INR ' + items[index].price.toString(),
                                textAlign: TextAlign.right,
                                style: Theme.of(context).textTheme.subtitle1),
                          ],
                        ),
                      );
                    }),
                SizedBox(height: 248),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          hintText: 'Add PromoCode',
                          fillColor: Colors.grey[100],
                          filled: true,
                          suffixIcon: TextButton(
                            onPressed: () {
//                            Scaffold.of(context).showSnackBar(new SnackBar(
//                                content: new Text('Promo Code Applied!')
//                            ));
                            },
                            child: Text(
                              'Apply',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: AppColorsConst.black),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          )),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    buildAmountRow('cart Total', '\$ 90.0'),
                    buildAmountRow('delivery Fee', '\$ 8.0'),
                    buildAmountRow('promo Code', '-\$ 10.0'),
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      // onTap: () => Navigator.popAndPushNamed(
                      //     context, CheckOutRoutes.selectAddress),
                      onTap: () => Navigator.pushNamed(context, 'address'),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        color: AppColorsConst.green,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Text(
                                'checkout Now',
                                style: Theme.of(context).textTheme.button,
                              ),
                              Spacer(
                                flex: 6,
                              ),
                              Text('Total',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[100],
                                      fontWeight: FontWeight.w500)),
                              Spacer(
                                flex: 1,
                              ),
                              Text(
                                '\$ 88.0',
                                style: Theme.of(context).textTheme.button,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }

  Padding buildAmountRow(String text, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          Spacer(),
          Text(
            price,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Container buildIconButton(IconData icon, int index, items, count) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.grey, width: 0)),
      child: IconButton(
        onPressed: () {
          setState(() {
            if (icon == Icons.remove) {
              if (count[index] > 0) count[index]--;
            } else {
              count[index]++;
            }
          });
        },
        icon: Icon(
          icon,
          color: Colors.grey[700],
          size: 16,
        ),
      ),
    );
  }
}
