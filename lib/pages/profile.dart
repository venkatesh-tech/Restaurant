import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:restaurant/animations/scaleRoute.dart';
import 'package:restaurant/values/values.dart';
import 'package:restaurant/widgets/addToCartButton.dart';
// import 'package:restaurant/widgets/bellyButton.dart';
// import 'package:restaurant/widgets/customButton.dart';
import 'package:restaurant/widgets/spaces.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: Sizes.ELEVATION_0,
          centerTitle: true,
          title: Text(
            StringConstant.PROFILE,
            style: TextStyle(color: AppColorsConst.black),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(top: Sizes.MARGIN_10),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(ImagePath.personImg),
                    minRadius: Sizes.RADIUS_60,
                    maxRadius: Sizes.RADIUS_60,
                  ),
                  SpacesHeight12(),
                  Text(
                    'Praveen Kumar',
                    style: TextStyle(
                        color: AppColorsConst.black,
                        fontWeight: FontWeight.bold,
                        fontSize: Sizes.TEXT_SIZE_22),
                  ),
                  SpacesHeight12(),
                  Text(
                    'pravileaf@gmail.com',
                    style: TextStyle(
                        color: AppColorsConst.grey,
                        fontWeight: FontWeight.w300,
                        fontSize: Sizes.TEXT_SIZE_16),
                  ),
                ],
              ),
              SpacesHeight16(),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    detail('250', 'Reviews'),
                    VerticalDivider(
                      width: Sizes.WIDTH_40,
                      thickness: 1.0,
                    ),
                    detail('100k', 'Followers'),
                    VerticalDivider(
                      width: Sizes.WIDTH_40,
                      thickness: 1.0,
                    ),
                    detail('250k', 'Following'),
                    VerticalDivider(
                      width: Sizes.WIDTH_40,
                      thickness: 1.0,
                    ),
                    SizedBox(
                      height: Sizes.HEIGHT_20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Sizes.HEIGHT_20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // BellyButton(
                  //   'Edit Profile',
                  //   () => Navigator.pushNamed(context, 'editprofile'),
                  //   width: MediaQuery.of(context).size.width,
                  //   height: Sizes.HEIGHT_48,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(Sizes.RADIUS_12),
                  //       color: Colors.blueAccent,
                  //       border: Border.all(
                  //           width: Sizes.WIDTH_1, color: Colors.white)),
                  // ),
                  // SizedBox(
                  //   width: 16.0,
                  // ),
                  // BellyButton(
                  //   'Settings',
                  //   () => Navigator.pushNamed(context, 'settings'),
                  //   width: MediaQuery.of(context).size.width,
                  //   height: Sizes.HEIGHT_48,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(Sizes.RADIUS_12),
                  //       color: Colors.blueAccent,
                  //       border: Border.all(
                  //           width: Sizes.WIDTH_1, color: Colors.white)),
                  // ),
                  // AddToCartButton(),

                  SpacesHeight16(),
                  AddToCartButton(),
                ],
              )
            ],
          ),
        ));
  }
}

Widget detail(String num, String text) {
  return Container(
      child: Column(
    children: <Widget>[
      Text(num,
          style: TextStyle(
              color: AppColorsConst.black,
              fontWeight: FontWeight.w600,
              fontSize: Sizes.TEXT_SIZE_18)),
      SizedBox(
        height: Sizes.HEIGHT_8,
      ),
      Text(text,
          style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w600,
              fontSize: Sizes.TEXT_SIZE_16)),
    ],
  ));
}
