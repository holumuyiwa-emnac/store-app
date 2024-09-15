// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../Pages/product_page.dart';
import '../components/cart_card.dart';

class Cart {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;

  Cart({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
  });

  // Factory constructor to create a Product object from JSON data
  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      image: json['image'],
    );
  }
}

class CartPage extends StatelessWidget {
  CartPage({super.key});

  final List cart = [
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
  ];

  double calculateTotal() {
    double total = 0.0;
    for (var amount in cart) {
      total += amount['price'];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    double cartTotal = calculateTotal();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      body: ListView(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: cart.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductPage(),
                        ),
                      );
                    },
                    child: CartCard(
                      itemName: cart[index]['name'],
                      itemPrice: cart[index]['price'],
                      itemImage: Image(
                          image: AssetImage('assets/${cart[index]['image']}')),
                      category: cart[index]['category'],
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '\$$cartTotal',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(4)),
                  child: Text(
                    'Check Out',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
