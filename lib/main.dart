import 'package:flutter/material.dart';
// included in almost all the pages - Material Theme UI
import 'package:restaurant/auth/signin.dart';
import 'package:restaurant/auth/signup.dart';
import 'package:restaurant/pages/ProductDetails.dart';
// import 'package:restaurant/pages/basicFormHandlings.dart';
import 'package:restaurant/pages/cartPage.dart';
import 'package:restaurant/pages/categoryList.dart';
import 'package:restaurant/pages/dashboard.dart';
// import 'package:restaurant/pages/localApiDataAccess.dart';
import 'package:restaurant/pages/productsList.dart';
import 'package:restaurant/pages/profile.dart';
import 'package:restaurant/pages/welcome.dart';
import 'package:restaurant/pages/checkout.dart';
import 'package:restaurant/util/notificationService.dart';
// import 'package:restaurant/values/values.dart';
// welcome, sigin, signup, resetpage, home

// Accessing API data
// import 'dart:async';
// import 'dart:convert';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().init();

  runApp(MaterialApp(
    home: WelcomePage(),
    title: 'Ecommerce',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      appBarTheme: AppBarTheme(color: Colors.indigo.shade300),
    ),
    // home: LocalPushNotificationTestPage(title: 'Local Notification'),
    debugShowCheckedModeBanner:
        false, //show or hide the debug banner at the top right corner
    routes: {
      'signin': (context) => SignInPage(),
      'signup': (context) => SignUpPage(),
      'dashboard': (context) => RestaurantHomePage(),
      'category': (context) => CategoryListPage(),
      'products': (context) => ProductListPage(),
      'products_detail': (context) => ProductDetailsPage(),
      'cart': (context) => CartPage(),
      'address': (context) => AddressPage(),
      'profile': (context) => ProfilePage(),
    },
  ));
}

// BuildContext context

// login page, register - others

// class MyApp extends StatelessWidget {
//   This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Restaurant',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: RestaurantHome(title: 'Dashboard'),
//     );
//   }
// }

// Stateless - immutable (not manipulated or static);
// Button, Icons, Page name
// Stateful - mutable - list(dynamic), wishlist, Database, button(action)
// stless, stful, stanim
// class RestaurantHome extends StatelessWidget {
//   const RestaurantHome({Key? key, title}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.blueAccent,
//         appBar: AppBar(
//           title: Text('Restaurant Demo'),
//           centerTitle: true,
//           backgroundColor: Colors.red,
//           toolbarHeight: 56,
//         ),
//         body: Container(
//             alignment: Alignment.center,
//             child: Text('Restaurant Opened now..!')));
//   }
// }

// Scaffold - View components - Container(), Column(), Row()

// class LocalPushNotificationTestPage extends StatefulWidget {
//   final String title;

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   NotificationService _notificationService = NotificationService();
//   //   _notificationService.showNotifications();
//   // }

//   LocalPushNotificationTestPage({Key? key, required this.title})
//       : super(key: key);

//   @override
//   _LocalPushNotificationTestPageState createState() =>
//       _LocalPushNotificationTestPageState();
// }

// class _LocalPushNotificationTestPageState
//     extends State<LocalPushNotificationTestPage> {
//   // Creating an Instance to access our notification service
//   NotificationService _notificationService = NotificationService();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Container(
//         margin: const EdgeInsets.symmetric(
//             vertical: Sizes.ELEVATION_10, horizontal: Sizes.ELEVATION_10),
//         child: Center(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               RaisedButton(
//                 onPressed: () async {
//                   _notificationService.showNotifications();
//                 },
//                 child: Text('Show Notification'),
//                 padding: const EdgeInsets.all(Sizes.PADDING_10),
//               ),
//               SizedBox(
//                 height: Sizes.HEIGHT_16,
//               ),
//               RaisedButton(
//                 onPressed: () async {
//                   _notificationService.scheduledNotifications();
//                 },
//                 child: Text('Scheduled Notification'),
//                 padding: const EdgeInsets.all(Sizes.PADDING_10),
//               ),
//               SizedBox(
//                 height: Sizes.HEIGHT_16,
//               ),
//               RaisedButton(
//                 onPressed: () async {
//                   _notificationService.cancelNotifications(0);
//                 },
//                 child: Text('Cancel Notification'),
//                 padding: const EdgeInsets.all(Sizes.PADDING_10),
//               ),
//               SizedBox(
//                 height: Sizes.HEIGHT_16,
//               ),
//               RaisedButton(
//                 onPressed: () async {
//                   _notificationService.cancelAllNotifications();
//                 },
//                 child: Text('Cancel All Notifications'),
//                 padding: const EdgeInsets.all(Sizes.PADDING_10),
//               ),
//               SizedBox(
//                 height: Sizes.HEIGHT_16,
//               ),
//               RaisedButton(
//                 onPressed: () async {
//                   _notificationService.showDynamicNotifications(
//                       1,
//                       'Dynamic Notification',
//                       'Ahh!...Dynamic Local notifcation executed...');
//                 },
//                 child: Text('Show Dynamic Notification'),
//                 padding: const EdgeInsets.all(Sizes.PADDING_10),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
