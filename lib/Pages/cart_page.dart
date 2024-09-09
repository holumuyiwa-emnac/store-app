// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:store_app/Pages/product_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List cart = [
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: SizedBox(
                child: ListView.builder(
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
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      contentPadding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                      tileColor: Colors.white,
                      leading: Image(
                          image: AssetImage('assets/${cart[index]['image']}')),
                      title: Text(
                        cart[index]['name'],
                        style: TextStyle(fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      subtitle: Text('\$${cart[index]['price']}'),
                      trailing: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              },
            )),
          ),
          Positioned(
              bottom: 12,
              child: Container(
                padding: EdgeInsets.all(24),
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
                      padding: EdgeInsets.only(top: 8, bottom: 8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.purple,
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
              ))
        ],
      ),
    );
  }
}
