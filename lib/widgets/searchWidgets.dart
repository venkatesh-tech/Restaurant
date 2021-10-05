import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant/values/values.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        child: TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Sizes.RADIUS_16),
                borderSide: BorderSide(
                    color: AppColorsConst.whiteShade_50,
                    width: 0,
                    style: BorderStyle.none),
              ),
              filled: true,
              prefixIcon:
                  Icon(FontAwesomeIcons.search, color: AppColorsConst.black),
              fillColor: AppColorsConst.secondaryColor,
              suffixIcon:
                  Icon(FontAwesomeIcons.sort, color: AppColorsConst.black),
              hintText: StringConstant.SEARCH,
              hintStyle: new TextStyle(color: AppColorsConst.searchHintColor)),
        ));
  }
}
