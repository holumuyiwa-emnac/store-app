// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String productTitle;
  final String productImage;

  const ProductCard({
    super.key,
    required this.productTitle,
    required this.productImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      width: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Image(
            height: 132,
            width: 132,
            fit: BoxFit.fill,
            image: AssetImage('assets/$productImage'),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            productTitle,
            style: TextStyle(fontSize: 10),
            textAlign: TextAlign.start,
          )
        ],
      ),
    );
  }
}
