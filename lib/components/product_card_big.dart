// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';

class ProductCardBig extends StatelessWidget {
  final String productTitle;
  final String productDetails;
  final String productImage;
  final double productPrice;

  const ProductCardBig({
    super.key,
    required this.productTitle,
    required this.productImage,
    required this.productPrice,
    required this.productDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            productImage,
            height: 188,
            width: 162,
            fit: BoxFit.fitWidth,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                  height: 188,
                  width: 162,
                  color: Colors.grey,
                  child: Center(
                    child: Text('Error loading image',
                        textAlign: TextAlign.center),
                  )); // Display a fallback error message
            },
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            productTitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            textAlign: TextAlign.start,
          ),
          Text(
            productDetails,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.start,
          ),
          Row(
            children: [
              Text(
                'Price:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                '\$$productPrice',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
