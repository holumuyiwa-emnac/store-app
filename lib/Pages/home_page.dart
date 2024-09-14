// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../Pages/product_page.dart';
import '../components/category_card.dart';
import '../components/product_card.dart';
import '../components/product_card_big.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Product>> fetchProducts() async {
    final response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }

  final List categories = [
    {
      'image': "women.png",
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
        backgroundColor: Color.fromARGB(255, 243, 243, 243),
        body: FutureBuilder<List<Product>>(
            future: fetchProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                final products = snapshot.data!;
                return SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Categories',
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(height: 12),
                      SizedBox(
                        height: 256, // Set a height for horizontal list
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
                              Text(
                                '${DateTime.now().year - 1}/${DateTime.now().year}',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w100),
                              ),
                            ],
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
                      SizedBox(height: 12),
                      SizedBox(
                        height: 286, // Set a height for horizontal list
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: products.length,
                            itemBuilder: (BuildContext context, int index) {
                              final product = products[index];
                              return GestureDetector(
                                onTap: () {
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
                      SizedBox(
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  mainAxisExtent: 320),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return GestureDetector(
                              onTap: () {
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
              } else {
                return Center(child: Text('No products available.'));
              }
            }));
  }
}
