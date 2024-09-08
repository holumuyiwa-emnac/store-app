// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:store_app/Pages/product_page.dart';

class FavoritePage extends StatelessWidget {
  final List favorites = [
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
  FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Column(
          //align to left
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: favorites.length,
              itemBuilder: (BuildContext context, index) {
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
                            image: AssetImage(
                                'assets/${favorites[index]['image']}')),
                        title: Text(
                          favorites[index]['name'],
                          style: TextStyle(fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        subtitle:
                            Text('\$${favorites[index]['price'].toString()}'),
                        trailing: Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
