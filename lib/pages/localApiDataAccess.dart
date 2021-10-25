import 'package:flutter/material.dart';
// Accessing API data
import 'dart:async';
import 'dart:convert';
// for http access
import 'package:http/http.dart' as http;
import 'package:restaurant/values/values.dart';

Future<Product> fetchProduct() async {
  final response =
      await http.get(Uri.parse("http://192.168.29.11:8000/product.json"));

  if (response.statusCode == 200) {
    // parse the JSON value and use it anywhere in the app
    return Product.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to load product data");
  }
}

class Product {
  late final String name;
  late final String price;
  late final String desc;

  Product({required this.name, required this.price, required this.desc});

  // factory Product.fromJson(List<Map<String, String>>)
  factory Product.fromJson(List<dynamic> data) {
    return Product(
        name: data[1000]['name'],
        price: data[1000]['price'],
        desc: data[1000]['desc']);
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Product> productList;

  @override
  void initState() {
    //  data fetch on load of this particular widget
    super.initState();
    productList = fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
          appBar: AppBar(
            title: const Text(StringConstant.APP_NAME),
          ),
          body: Center(
            child: FutureBuilder<Product>(
              future: productList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.name.toString() +
                      ' ' +
                      snapshot.data!.price.toString() +
                      '\n' +
                      snapshot.data!.desc.toString());
                } else if (snapshot.hasError) {
                  // return Text('${snapshot.hasError}');
                  return Text('OOPs!!... no data availble...');
                }
                return const CircularProgressIndicator();
              },
            ),
          )),
    );
  }
}
