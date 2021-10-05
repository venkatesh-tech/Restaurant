import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant/animations/scaleRoute.dart';
import 'package:restaurant/pages/ProductDetails.dart';
// import 'package:restaurant/animations/scaleRoute.dart';
// import 'package:restaurant/animations/navigateAnimation.dart';
import 'package:restaurant/values/values.dart';
import 'package:restaurant/widgets/bottomNavigationBar.dart';
import 'package:restaurant/widgets/cardWidget.dart';
import 'package:restaurant/widgets/spaces.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            StringConstant.PRODUCT_LIST,
            style: TextStyle(color: AppColorsConst.black),
          ),
          centerTitle: true,
          leading: InkWell(
            onTap: () => {Navigator.pushNamed(context, 'dashboard')},
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.shoppingBag,
                  color: AppColorsConst.black,
                ))
          ]),
      body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: Sizes.MARGIN_16,
            vertical: Sizes.MARGIN_16,
          ),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  child: CardWidget(
                      StringConstant.CHINESE,
                      BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        image: DecorationImage(
                            image: AssetImage(ImagePath.bakeryImg),
                            fit: BoxFit.cover),
                      ),
                      () => Navigator.push(
                          context, ScaleRoute(ProductDetailsPage()))),
                );
              },
              separatorBuilder: (context, index) {
                return SpacesHeight16();
              },
              itemCount: 6)),
      bottomNavigationBar: BottomBarNavigation(),
    );
  }
}
