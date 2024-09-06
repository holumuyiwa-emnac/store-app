// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../components/product_card.dart';
import '../components/product_card_big.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List products = [
    {
      'name': "Nike F.C. Women's Tie-Dye Football Shirt",
      'image': 'product.png'
    },
    {'name': "Adidas Men's Tie-Dye Football Shirt", 'image': 'product.png'},
    {'name': "Adidas Men's Football Shirt", 'image': 'product.png'},
    {'name': "Adidas Women's Tie-Dye Football Shirt", 'image': 'product.png'},
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
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
                    child: Container(
                      width: 260,
                      height: 246,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    width: 260,
                    height: 246,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,
                    ),
                  ),
                ],
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
              height: 186, // Set a height for horizontal list
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ProductCard(
                      productTitle: products[0]['name'],
                      productImage: products[0]['image']),
                  SizedBox(
                    width: 12,
                  ),
                  ProductCard(
                      productTitle: products[1]['name'],
                      productImage: products[1]['image']),
                  SizedBox(
                    width: 12,
                  ),
                  ProductCard(
                      productTitle: products[2]['name'],
                      productImage: products[2]['image'])
                ],
              ),
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
              height: 460,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.8,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCardBig(
                    productTitle: products[index]['name'],
                    productImage: products[index]['image'],
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
