// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CartAndFavoriteCard extends StatelessWidget {
  final String itemName;
  final int itemPrice;
  final Image itemImage;

  const CartAndFavoriteCard(
      {super.key,
      required this.itemName,
      required this.itemPrice,
      required this.itemImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: ListTile(
        contentPadding: EdgeInsets.fromLTRB(8, 2, 8, 2),
        tileColor: Colors.white,
        leading: itemImage,
        title: Text(
          itemName,
          style: TextStyle(fontSize: 14),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        subtitle: Text('\$${itemPrice.toString()}'),
        trailing: Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
    );
  }
}
