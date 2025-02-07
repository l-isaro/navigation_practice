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

class ProductCard extends StatelessWidget {
  final String title;
  final String description;
  final Color color;
  final int? rating;
  final int price;

  const ProductCard({
    super.key,
    required this.title,
    required this.description,
    required this.color,
    this.rating,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Navigator.pushNamed(
              context,
              '/product',
              arguments: {
                'title': title,
                'description': description,
                'price': price,
                'rating': rating ?? 0,
                'color': color,
              },
            ),
        child: Card(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  color: color,
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(description),
                    Text('Price: \$${price}'),
                    if (rating != null)
                      Stars(rating: rating!)
                    else
                      Stars(rating: 0),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class Stars extends StatelessWidget {
  final int rating;

  const Stars({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    int displayedRating = rating.clamp(0, 3);

    List<Widget> stars = List.generate(3, (index) {
      return Icon(
        index < displayedRating ? Icons.star : Icons.star_border,
        color: Colors.amber,
        size: 24,
      );
    });

    return Row(
      mainAxisAlignment:
          MainAxisAlignment.center, // Center the stars horizontally
      children: stars,
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the arguments passed via Navigator.pushNamed
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (args == null) {
      return Scaffold(
        appBar: AppBar(title: Text("Error")),
        body: Center(child: Text('No data passed to the screen')),
      );
    }

    // Extract product data from arguments
    final String title = args['title'];
    final String description = args['description'];
    final int price = args['price'];
    final int rating = args['rating'];
    final Color color = args['color'];

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: color,
        ),
        body: Padding(
          padding: const EdgeInsets.all(0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  color: color,
                  alignment: Alignment.center,
                  child: Center(
                    child: Text(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text('Description: $description'),
                SizedBox(height: 16),
                Text('Price: \$${price}'),
                SizedBox(height: 16),
                Text('Rating:'),
                Stars(rating: rating),
              ],
            ),
          ),
        ));
  }
}
