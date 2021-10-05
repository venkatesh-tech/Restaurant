import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant/values/values.dart';
import 'package:restaurant/widgets/customButton.dart';

class Address {
  String address;
  String heading;
  Address(this.address, this.heading);
}

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  List<int> radioButtons = [0, -1, -1];

  @override
  Widget build(BuildContext context) {
    List<Address> addressList = [
      Address('124, Natesan Street, T.Nagar, Chennai, Tamilnadu, IN', 'Home'),
      Address(
          '74, Natesan Street, Indira Nagar, Guntut, Tamilnadu, IN', 'Work'),
      Address(
          '124, Palestine Street, Jackson Tower, New York, USA', 'Temporary'),
    ];

    return Scaffold(
        body: FadedSlideAnimation(
      Column(
        children: [
          Stack(
            children: [
              Image.asset(ImagePath.headerImg,
                  height: Sizes.HEIGHT_200, fit: BoxFit.fitHeight),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FontAwesomeIcons.arrowLeft,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.only(top: 68)),
              Positioned.directional(
                  textDirection: Directionality.of(context),
                  top: 70.0,
                  start: MediaQuery.of(context).size.width / 3.5,
                  child: Text('Selected Address',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: Sizes.TEXT_SIZE_18,
                          color: Theme.of(context).scaffoldBackgroundColor,
                          letterSpacing: 1.0))),
              Positioned.directional(
                  top: 130.0,
                  textDirection: Directionality.of(context),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // start
                    children: [
                      Icon(Icons.location_on, color: Colors.white),
                      Text('....',
                          style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: Sizes.TEXT_SIZE_40)),
                      Icon(Icons.credit_card, color: Colors.white),
                      Text('....',
                          style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: Sizes.TEXT_SIZE_40)),
                      Icon(Icons.person, color: Colors.white),
                      Text('....',
                          style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: Sizes.TEXT_SIZE_40)),
                      Icon(Icons.home, color: Colors.white),
                    ],
                  ))
            ],
          ),
          ListView.builder(
            padding: EdgeInsets.all(0.0),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.only(top: Sizes.PADDING_36),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Radio(
                          value: index,
                          groupValue: radioButtons[index],
                          onChanged: (value) {
                            setState(() {
                              for (int i = 0; i < radioButtons.length; i++) {
                                radioButtons[i] = -1;
                              }
                              radioButtons[index] = index;
                            });
                          }),
                      SizedBox(width: Sizes.WIDTH_6),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            addressList[index].heading,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: Sizes.HEIGHT_20),
                          Text(
                            addressList[index].address,
                            softWrap: true,
                          ),
                        ],
                      )
                    ],
                  ));
            },
          ),
          Spacer(),
          CustomButton(
              'Check Out',
              Text('Payemnt'),
              () => Navigator.pushNamed(context, 'payment'),
              AppColorsConst.green,
              200.0,
              48.0,
              Icon(Icons.credit_card, color: Colors.white),
              8.0)
        ],
      ),
      beginOffset: Offset(0.0, 0.0),
      endOffset: Offset(0.0, 0.0),
      slideCurve: Curves.linearToEaseOut,
    ));
  }
}
