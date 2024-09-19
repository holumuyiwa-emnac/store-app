// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CartCard extends StatelessWidget {
  final String itemName;
  final double itemPrice;
  final Image itemImage;
  final String category;
  final int quantity;

  const CartCard(
      {super.key,
      required this.itemName,
      required this.itemPrice,
      required this.itemImage,
      required this.category,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        contentPadding: EdgeInsets.fromLTRB(8, 2, 8, 2),
        tileColor: Colors.white,
        leading: itemImage,
        title: Text(
          itemName,
          style: TextStyle(fontSize: 16),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
            Text('\$${itemPrice.toString()}',
                style: TextStyle(fontSize: 16, color: Colors.red)),
          ],
        ),
        trailing: Icon(
          Icons.delete,
          color: Colors.red,
          size: 24,
        ),
      ),
    );
  }
}
