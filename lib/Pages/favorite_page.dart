// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../Pages/product_page.dart';
import '../components/favorite_card.dart';

class FavoritePage extends StatelessWidget {
  final List favorites = [
    {
      'name': "Nike F.C. Women's Tie-Dye Football Shirt",
      'image': 'product.png',
      'price': 55,
      'category': "women's wears"
    },
    {
      'name': "Adidas Men's Tie-Dye Football Shirt",
      'image': 'product.png',
      'price': 65,
      'category': "women's wears"
    },
    {
      'name': "Adidas Men's Football Shirt",
      'image': 'product.png',
      'price': 100,
      'category': "women's wears"
    },
    {
      'name': "Adidas Women's Tie-Dye Football Shirt",
      'image': 'product.png',
      'price': 85,
      'category': "women's wears"
    },
    {
      'name': "Nike F.C. Women's Tie-Dye Football Shirt",
      'image': 'product.png',
      'price': 55,
      'category': "women's wears"
    },
    {
      'name': "Adidas Men's Tie-Dye Football Shirt",
      'image': 'product.png',
      'price': 65,
      'category': "women's wears"
    },
    {
      'name': "Adidas Men's Football Shirt",
      'image': 'product.png',
      'price': 100,
      'category': "women's wears"
    },
    {
      'name': "Adidas Women's Tie-Dye Football Shirt",
      'image': 'product.png',
      'price': 85,
      'category': "women's wears"
    },
  ];
  FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: favorites.length,
          itemBuilder: (BuildContext context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductPage(
                      productId: 11,
                    ),
                  ),
                );
              },
              child: FavoriteCard(
                itemName: favorites[index]['name'],
                itemPrice: favorites[index]['price'],
                itemImage: Image(
                    image: AssetImage('assets/${favorites[index]['image']}')),
                category: favorites[index]['category'],
              ),
            );
          },
        ),
      ),
    );
  }
}
