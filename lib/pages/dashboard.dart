import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

final TextStyle blackText = TextStyle(color: Colors.black);
final TextStyle whiteText = TextStyle(color: Colors.white);
final TextStyle blueText = TextStyle(color: Colors.blueAccent);

class RestaurantHomePage extends StatefulWidget {
  const RestaurantHomePage({Key? key}) : super(key: key);

  static final path = 'lib/pages/dashboard.dart';

  @override
  _RestaurantHomePageState createState() => _RestaurantHomePageState();
}

class _RestaurantHomePageState extends State<RestaurantHomePage> {
  @override
  Widget build(BuildContext context) {
    Widget _imageCarousel = Container(
        height: 200,
        child: Carousel(
          boxFit: BoxFit.fill,
          images: [
            AssetImage('assets/Vegetables.png'),
            AssetImage('assets/Bakery.png'),
            AssetImage('assets/Foodgrains.png'),
            AssetImage('assets/Household.png'),
          ],
          animationDuration: Duration(milliseconds: 2000),
          autoplay: true,
          animationCurve: Curves.fastOutSlowIn,
        ));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Flipkart'),
        actions: [
          IconButton(
              onPressed: () {
                print('search button pressed');
              },
              icon: const Icon(Icons.search, color: Colors.white)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_bag, color: Colors.white)),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('Praveen Kumar'),
              accountEmail: const Text('pravileaf@gmail'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey.shade100,
                  child: Icon(
                    Icons.person,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              decoration: const BoxDecoration(color: Colors.blueAccent),
            ),
            const InkWell(
              child: ListTile(
                title: Text(
                  'Home',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                leading: Icon(Icons.home),
              ),
            ),
            const InkWell(
              child: ListTile(
                title: Text(
                  'Profile',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                leading: Icon(Icons.person),
              ),
            ),
            const InkWell(
              child: ListTile(
                title: Text(
                  'My orders',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                leading: Icon(Icons.shopping_basket),
              ),
            ),
            const InkWell(
              child: ListTile(
                title: Text(
                  'Favorites',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                leading: Icon(Icons.favorite),
              ),
            ),
            const InkWell(
              child: ListTile(
                title: Text(
                  'Settings',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                leading: Icon(Icons.settings),
              ),
            ),
            const InkWell(
              child: ListTile(
                title: Text(
                  'About us',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                leading: Icon(Icons.help),
              ),
            ),
            const InkWell(
              child: ListTile(
                title: Text(
                  'Terms & Conditions',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                leading: Icon(Icons.file_copy),
              ),
            ),
            const Divider(
              height: 30,
            ),
            const InkWell(
              child: ListTile(
                title: Text(
                  'Version 0.0.1',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          _imageCarousel,
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Featured Products',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            height: 120,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return _featuredList(context);
              },
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Wishlist',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            height: 120,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return _wishList(context);
              },
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Categories',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            height: 120,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return _categoryList(context);
              },
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Brands',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            height: 120,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return _brandsList(context);
              },
            ),
          ),
        ],
      ),
      // carousel
    );
  }
}

Widget _featuredList(BuildContext context) {
  return InkWell(
      child: Column(
    children: <Widget>[
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          image: DecorationImage(
              image: AssetImage('assets/Bakery.png'), fit: BoxFit.cover),
        ),
        alignment: Alignment.center,
        width: 100,
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
      ),
      SizedBox(
        height: 10.0,
      ),
      Text('Vegetables')
    ],
  ));
}

Widget _wishList(BuildContext context) {
  return InkWell(
      child: Column(
    children: <Widget>[
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          image: DecorationImage(
              image: AssetImage('assets/Vegetables.png'), fit: BoxFit.cover),
        ),
        alignment: Alignment.center,
        width: 100,
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
      ),
      SizedBox(
        height: 10.0,
      ),
      Text('Vegetables')
    ],
  ));
}

Widget _categoryList(BuildContext context) {
  return InkWell(
      child: Column(
    children: <Widget>[
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          image: DecorationImage(
              image: AssetImage('assets/Foodgrains.png'), fit: BoxFit.cover),
        ),
        alignment: Alignment.center,
        width: 100,
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
      ),
      SizedBox(
        height: 10.0,
      ),
      Text('Vegetables')
    ],
  ));
}

Widget _brandsList(BuildContext context) {
  return InkWell(
      child: Column(
    children: <Widget>[
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          image: DecorationImage(
              image: AssetImage('assets/Household.png'), fit: BoxFit.cover),
        ),
        alignment: Alignment.center,
        width: 100,
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
      ),
      SizedBox(
        height: 10.0,
      ),
      Text('Vegetables')
    ],
  ));
}
