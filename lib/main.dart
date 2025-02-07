import 'package:flutter/material.dart';
// import 'package:mobile_dev_navigation_practice/screens/product_details_screen.dart';
// import 'package:mobile_dev_navigation_practice/screens/product_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductScreen(),
      routes: {
        '/product': (context) => ProductDetailsScreen(),
      },
    );
  }
}
