// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../Pages/product_page.dart';
import '../components/category_card.dart';
import '../components/product_card.dart';
import '../components/product_card_big.dart';
import '../components/api_service.dart';
import '../components/product_class.dart';

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
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error fetching products'),
            );
          } else if (snapshot.hasData) {
            final products = snapshot.data!;
            return SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Categories', style: TextStyle(fontSize: 24)),
                  SizedBox(height: 12),
                  SizedBox(
                    height: 256,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: categories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CategoryCard(
                          image: categories[index]['image'],
                          title: categories[index]['title'],
                          subtile: categories[index]['subtitle'],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('New Arrivals', style: TextStyle(fontSize: 16)),
                      TextButton(
                        onPressed: () {},
                        child: Text('View All', style: TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    height: 286,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return GestureDetector(
                          onTap: () {
                            // Pass product ID to ProductPage
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductPage(productId: product.id),
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
                      },
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('All Products', style: TextStyle(fontSize: 16)),
                      TextButton(
                        onPressed: () {},
                        child: Text('View All', style: TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                  SizedBox(
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        mainAxisExtent: 320,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return GestureDetector(
                          onTap: () {
                            // Pass product ID to ProductPage
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductPage(productId: product.id),
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
        },
      ),
    );
  }
}
