import 'package:flutter/material.dart';
import 'package:restaurant/values/values.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBarNavigation extends StatefulWidget {
  const BottomBarNavigation({Key? key}) : super(key: key);

  @override
  _BottomBarNavigationState createState() => _BottomBarNavigationState();
}

class _BottomBarNavigationState extends State<BottomBarNavigation> {
  @override
  Widget build(BuildContext context) {
    int _selectedindex = 0;
    void _onItemTap(int index) {
      setState(() {
        _selectedindex = index;
      });
    }

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home), label: StringConstant.HOME),
        BottomNavigationBarItem(
            icon: Icon(Icons.near_me), label: StringConstant.NEAR_BY),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.shoppingCart),
            label: StringConstant.CART),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user), label: StringConstant.PROFILE),
      ],
      currentIndex: _selectedindex,
      selectedItemColor: Color(0xFFF82727),
      onTap: _onItemTap,
    );
  }
}
