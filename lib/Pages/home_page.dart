// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../Pages/product_page.dart';
import '../components/category_card.dart';
import '../components/product_card.dart';
import '../components/product_card_big.dart';
import '../components/api_service.dart';

class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
  });

  // Factory constructor to create a Product object from JSON data
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      image: json['image'],
    );
  }
}

// HomePage widget (stateful) which will display the product list and categories
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Static list of categories for display
  final List categories = [
    {
      'image': "women.png", // Local image path for the category
      'title': "Women's",
      'subtitle': "Wears & Accessories",
    },
    {
      'image': "men.png",
      'title': "Men's",
      'subtitle': "Wears & Accessories",
    },
    {
      'image': "kids.png",
      'title': "Kid's",
      'subtitle': "Wears & Accessories",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 243, 243, 243), // Background color
        body: FutureBuilder<List<Product>>(
            future: fetchProducts(), // Fetch the product list from API service
            builder: (context, snapshot) {
              // Show loading indicator while waiting for data
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Colors.black,
                      strokeWidth: 8,
                      strokeCap: StrokeCap.round,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Loading..',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ));
              }
              // Handle error during data fetching
              else if (snapshot.hasError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '404..',
                        style: TextStyle(fontSize: 40),
                      ),
                      Text('Unable to fetch data at this moment.')
                    ],
                  ),
                );
              }
              // Display the data once fetched
              else if (snapshot.hasData) {
                final products = snapshot.data!; // List of products
                return SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 16), // Page padding
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Section for categories display
                      Text(
                        'Categories',
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(height: 12),
                      // Horizontal list view to show categories
                      SizedBox(
                        height: 256,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: categories.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return CategoryCard(
                                image: categories[index]['image'],
                                title: categories[index]['title'],
                                subtile: categories[index]['subtitle']);
                          },
                        ),
                      ),
                      SizedBox(height: 12),
                      // Section for new arrivals
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'New Arrivals',
                                style: TextStyle(fontSize: 16),
                              ),
                              // Display the current year
                              Text(
                                '${DateTime.now().year - 1}/${DateTime.now().year}',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w200),
                              ),
                            ],
                          ),
                          // 'View All' button for new arrivals
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'View All',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      // Horizontal list of new arrival products
                      SizedBox(
                        height: 286,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              final product = products[index];
                              return GestureDetector(
                                onTap: () {
                                  // Navigate to product page on tap
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductPage(),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: ProductCard(
                                    productTitle: product.title,
                                    productDetails: product.description,
                                    productImage: product.image,
                                    productPrice: product.price,
                                  ),
                                ),
                              );
                            }),
                      ),
                      SizedBox(height: 12),
                      // Section for 'Home Kits' display
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Home Kits',
                            style: TextStyle(fontSize: 16),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'View All',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      // Grid view for displaying products under 'Home Kits'
                      SizedBox(
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, // 2 items per row
                                  crossAxisSpacing: 10, // Horizontal spacing
                                  mainAxisSpacing: 10, // Vertical spacing
                                  mainAxisExtent: 320), // Item height
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return GestureDetector(
                              onTap: () {
                                // Navigate to product page on tap
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductPage(),
                                  ),
                                );
                              },
                              child: ProductCardBig(
                                productTitle: product.title,
                                productDetails: product.description,
                                productImage: product.image,
                                productPrice: product.price,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
              // Fallback when no products are available
              else {
                return Center(child: Text('No products available.'));
              }
            }));
  }
}
