// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:store_app/components/category_card.dart';
import '../components/product_card.dart';
import '../components/product_card_big.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List products = [
    {
      'name': "Nike F.C. Women's Tie-Dye Football Shirt",
      'image': 'product.png',
      'price': 55
    },
    {
      'name': "Adidas Men's Tie-Dye Football Shirt",
      'image': 'product.png',
      'price': 65
    },
    {
      'name': "Adidas Men's Tie-Dye Football Shirt",
      'image': 'product.png',
      'price': 65
    },
    {
      'name': "Adidas Men's Tie-Dye Football Shirt",
      'image': 'product.png',
      'price': 65
    },
    {
      'name': "Adidas Men's Football Shirt",
      'image': 'product.png',
      'price': 100
    },
    {
      'name': "Adidas Women's Tie-Dye Football Shirt",
      'image': 'product.png',
      'price': 85
    },
  ];

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
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(fontSize: 20),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'View All',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            SizedBox(
              height: 246, // Set a height for horizontal list
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w100),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'View All',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            SizedBox(
              height: 192, // Set a height for horizontal list
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: ProductCard(
                        productTitle: products[index]['name'],
                        productImage: products[index]['image'],
                        productPrice: products[index]['price'],
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
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            SizedBox(
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.78,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCardBig(
                    productTitle: products[index]['name'],
                    productImage: products[index]['image'],
                    productPrice: products[index]['price'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
