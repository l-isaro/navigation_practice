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

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  static final List<Map<String, dynamic>> products = [
    {
      'name': 'Pixel',
      'description': 'Pixel is the most feautureful phone ever',
      'price': 800,
      'rating': 2,
      'color': Colors.blue,
    },
    {
      'name': 'laptop',
      'description': 'Laptop is the most productive development tool',
      'price': 2000,
      'rating': 3,
      'color': Colors.green,
    },
    {
      'name': 'Tablet',
      'description': 'Tablet is the most productive development tool',
      'price': 1500,
      'rating': 0,
      'color': Colors.yellow,
    },
    {
      'name': 'Phone',
      'description': 'Phone is the most productive development tool',
      'price': 1000,
      'rating': 0,
      'color': Colors.red,
    },
    {
      'name': 'Pen Drive',
      'description': 'Pen Drive is the most productive development tool',
      'price': 500,
      'rating': 0,
      'color': Colors.purple,
    },
    {
      'name': 'Floppy Drive',
      'description': 'Floppy Drive is the most productive development tool',
      'price': 50,
      'rating': 0,
      'color': Colors.orange,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Product Navigation"), backgroundColor: Colors.blue),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(
            title: products[index]['name'],
            description: products[index]['description'],
            price: products[index]['price'],
            rating: products[index]['rating'],
            color: products[index]['color'],
          );
        },
      ),
    );
  }
}
