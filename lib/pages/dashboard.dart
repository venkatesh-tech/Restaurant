import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/services.dart';
// import 'package:restaurant/animations/scaleRoute.dart';
import 'package:restaurant/animations/navigateAnimation.dart';
import 'package:restaurant/values/values.dart';
import 'package:restaurant/widgets/bottomNavigationBar.dart';
// import 'package:restaurant/widgets/customAppBar.dart';
import 'package:restaurant/widgets/searchWidgets.dart';
import 'package:restaurant/widgets/popularFoods.dart';
import 'package:restaurant/auth/signin.dart';

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
        height: Sizes.HEIGHT_200,
        child: Carousel(
          boxFit: BoxFit.fill,
          images: [
            AssetImage(ImagePath.houseImg),
            AssetImage(ImagePath.vegImg),
            AssetImage(ImagePath.bakeryImg),
            AssetImage(ImagePath.foodImg)
          ],
          animationDuration: Duration(milliseconds: 2000),
          autoplay: true,
          animationCurve: Curves.fastOutSlowIn,
          dotSize: Sizes.SIZE_4,
          dotSpacing: Sizes.SIZE_12,
          dotColor: Colors.redAccent,
          indicatorBgPadding: Sizes.SIZE_6,
          dotBgColor: AppColorsConst.secondaryColor,
          borderRadius: true,
        ));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: AppColorsConst.black),
        // title: Text(StringConstant.APP_NAME),
        title: Text(StringConstant.HOME_TITLE,
            style: TextStyle(
                fontSize: Sizes.SIZE_16,
                fontWeight: FontWeight.w500,
                color: AppColorsConst.black)),
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.pushNamed(context, 'signin');
                Navigator.push(context, RotationRoute(SignInPage()));
              },
              icon: const Icon(Icons.search, color: Colors.black)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_bag, color: Colors.black)),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text(StringConstant.DEFAULT_USER_NAME),
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
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(
                  'Home',
                  style: TextStyle(
                      fontSize: Sizes.SIZE_16, fontWeight: FontWeight.w500),
                ),
                leading: Icon(Icons.home),
              ),
            ),
            const InkWell(
              child: ListTile(
                title: Text(
                  'Profile',
                  style: TextStyle(
                      fontSize: Sizes.SIZE_16, fontWeight: FontWeight.w500),
                ),
                leading: Icon(Icons.person),
              ),
            ),
            const InkWell(
              child: ListTile(
                title: Text(
                  'My orders',
                  style: TextStyle(
                      fontSize: Sizes.SIZE_16, fontWeight: FontWeight.w500),
                ),
                leading: Icon(Icons.shopping_basket),
              ),
            ),
            InkWell(
              onTap: () => {Navigator.pushNamed(context, 'category')},
              child: ListTile(
                title: Text(
                  'Category',
                  style: TextStyle(
                      fontSize: Sizes.SIZE_16, fontWeight: FontWeight.w500),
                ),
                leading: Icon(Icons.favorite),
              ),
            ),
            InkWell(
              onTap: () => {Navigator.pushNamed(context, 'address')},
              child: ListTile(
                title: Text(
                  'Cart',
                  style: TextStyle(
                      fontSize: Sizes.SIZE_16, fontWeight: FontWeight.w500),
                ),
                leading: Icon(Icons.favorite),
              ),
            ),
            const InkWell(
              child: ListTile(
                title: Text(
                  'Settings',
                  style: TextStyle(
                      fontSize: Sizes.SIZE_16, fontWeight: FontWeight.w500),
                ),
                leading: Icon(Icons.settings),
              ),
            ),
            const InkWell(
              child: ListTile(
                title: Text(
                  'About us',
                  style: TextStyle(
                      fontSize: Sizes.SIZE_16, fontWeight: FontWeight.w500),
                ),
                leading: Icon(Icons.help),
              ),
            ),
            const InkWell(
              child: ListTile(
                title: Text(
                  'Terms & Conditions',
                  style: TextStyle(
                      fontSize: Sizes.SIZE_16, fontWeight: FontWeight.w500),
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
                  StringConstant.APP_VERSION,
                  style: TextStyle(
                      fontSize: Sizes.SIZE_16, fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          SearchWidget(),
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
          PopularFoodWidget(),
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
        ],
      ),
      // carousel
      bottomNavigationBar: BottomBarNavigation(),
    );
  }
}

Widget _featuredList(BuildContext context) {
  return InkWell(
    onTap: () {
        Navigator.pushNamed(context, 'category');
      },
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
